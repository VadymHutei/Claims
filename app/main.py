import datetime
from random import choice
from flask import Flask, render_template, request, redirect, url_for, make_response
from claims_model import Model
import conf



# Variables
tokens = []
app = Flask(__name__)
model = Model()



# Functions
def createRandomString(n=8):
    abc = 'abcdefghijklmnopqrstuvwxyz0123456789'
    return ''.join([choice(abc) for _ in range(n)])

def isAuth():
    cookie = request.cookies.get('cat')
    return cookie is not None and cookie in tokens

def auth():
    password = request.form['password']
    return password == conf.ACP_CURRENT_CONFIG['password']

def createToken():
    token = createRandomString(16)
    tokens.append(token)
    return token

def createStoreId():
    store_id = createRandomString(8)
    return store_id

def login():
    model.addAdminSession(request.headers.get('User-Agent', 'Unknown User-Agent'))
    token = createToken()
    expire_date = datetime.datetime.now()
    expire_date = expire_date + datetime.timedelta(**conf.ACP_CURRENT_CONFIG['cookie_lifetime'])
    response = make_response(redirect(url_for('acp')))
    response.set_cookie('cat', token, expires=expire_date)
    return response

def auth_decorator(func):
    def wrap():
        if not isAuth():
            return redirect(url_for('acp_login'))
        return func()
    wrap.__name__ = func.__name__
    return wrap


# App
@app.route('/', methods=['GET'])
def main():
    return render_template('main.html')



# ACP
@app.route('/acp/', methods=['GET'])
@auth_decorator
def acp():
    return render_template('acp/main.html')

# Авторизация
@app.route('/acp/login', methods=['GET'])
def acp_login():
    return render_template('acp/login.html')

@app.route('/acp/auth', methods=['POST'])
def acp_auth():
    if auth():
        return login()
    return redirect(url_for('acp_login'))

# Магазины
@app.route('/acp/stores/', methods=['GET'])
@auth_decorator
def acp_stores():
    sort = request.args.get('sort', 'city')
    stores, sorted_stores_ids = model.getStores(sort)
    managers = model.getManagers()
    return render_template('acp/stores.html', stores=stores, sorted_stores_ids=sorted_stores_ids, managers=managers)

@app.route('/acp/stores/<path:store_id>', methods=['GET'])
@auth_decorator
def acp_store(store_id):
    store = model.getStore(store_id)
    manager = model.getManager(store['manager_id'])
    claims = model.getClaims(store_id)
    return render_template('acp/store.html', store=store, manager=manager, claims=claims)

@app.route('/acp/stores/add/', methods=['GET'])
@auth_decorator
def acp_store_add():
    new_store_id = createStoreId()
    managers = model.getManagers()
    return render_template('acp/add_store.html', managers=managers, new_store_id=new_store_id)

@app.route('/acp/stores/insert', methods=['POST'])
@auth_decorator
def acp_store_insert():
    model.insertStore(request.form.to_dict())
    return redirect(url_for('acp_stores'))

@app.route('/acp/stores/delete/<path:store_id>', methods=['GET'])
@auth_decorator
def acp_store_delete(store_id):
    model.deleteStore(store_id)
    return redirect(url_for('acp_stores'))

@app.route('/acp/stores/edit/<path:store_id>', methods=['GET'])
@auth_decorator
def acp_store_edit(store_id):
    store = model.getStore(store_id)
    managers = model.getManagers()
    return render_template('acp/edit_store.html', store=store, managers=managers)

@app.route('/acp/stores/update', methods=['POST'])
@auth_decorator
def acp_store_update():
    model.updateStore(request.form.to_dict())
    return redirect(url_for('acp_store_edit', store_id=request.form['id']))

# Менеджеры
@app.route('/acp/managers/', methods=['GET'])
@auth_decorator
def acp_managers():
    managers = model.getManagers()
    return render_template('acp/managers.html', managers=managers)

@app.route('/acp/managers/add/', methods=['GET'])
@auth_decorator
def acp_manager_add():
    managers = model.getManagers()
    return render_template('acp/add_manager.html')

@app.route('/acp/managers/insert', methods=['POST'])
@auth_decorator
def acp_manager_insert():
    model.insertManager(request.form.to_dict())
    return redirect(url_for('acp_managers'))

@app.route('/acp/managers/delete/<path:manager_id>', methods=['GET'])
@auth_decorator
def acp_manager_delete(manager_id):
    model.deleteManager(manager_id)
    return redirect(url_for('acp_managers'))

@app.route('/acp/managers/edit/<path:manager_id>', methods=['GET'])
@auth_decorator
def acp_manager_edit(manager_id):
    managers = model.getManagers()
    return render_template('acp/edit_manager.html', manager=managers[int(manager_id)])

@app.route('/acp/managers/update', methods=['POST'])
@auth_decorator
def acp_manager_update():
    model.updateМanager(request.form.to_dict())
    return redirect(url_for('acp_manager_edit', manager_id=request.form['id']))


if __name__ == '__main__':
    app.run(**conf.APP_CURRENT_PARAMS)