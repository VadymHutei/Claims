import datetime
from random import choice
from flask import Flask, render_template, request, redirect, url_for, make_response
from claims_model import Model



# Variables
ACP_PASSWORD = '123'
tokens = []
app = Flask(__name__)
model = Model()



# Functions
def createRandomString(n=16):
    abc = 'abcdefghijklmnopqrstuvwxyz0123456789'
    return ''.join([choice(abc) for _ in range(n)])

def isAuth():
    cookie = request.cookies.get('cat')
    return cookie is not None and cookie in tokens

def auth():
    password = request.form['password']
    return password == ACP_PASSWORD

def createToken():
    token = createRandomString()
    tokens.append(token)
    return token

def login():
    model.addAdminSession(request.headers.get('User-Agent', 'Unknown User-Agent'))
    token = createToken()
    expire_date = datetime.datetime.now()
    expire_date = expire_date + datetime.timedelta(days=30)
    response = make_response(redirect(url_for('acp')))
    response.set_cookie('cat', token, expires=expire_date)
    return response


# App
@app.route('/', methods=['GET'])
def main():
    return render_template('main.html')



# ACP
@app.route('/acp/', methods=['GET'])
def acp():
    # if not isAuth():
    #     return redirect(url_for('acp_login'))
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
def acp_stores():
    stores = model.getStores()
    managers = model.getManagers()
    return render_template('acp/stores.html', stores=stores, managers=managers)

@app.route('/acp/stores/<path:store_id>', methods=['GET'])
def acp_store(store_id):
    store = model.getStore(store_id)
    manager = model.getManager(store['manager_id'])
    claims = model.getClaims(store_id)
    return render_template('acp/store.html', store=store, manager=manager, claims=claims)

@app.route('/acp/stores/edit/<path:store_id>', methods=['GET'])
def acp_store_edit(store_id):
    store = model.getStore(store_id)
    managers = model.getManagers()
    return render_template('acp/edit_store.html', store=store, managers=managers)

@app.route('/acp/store/update', methods=['POST'])
def acp_store_update():
    model.updateStore(request.form.to_dict())
    return redirect(url_for('acp_store_edit', store_id=request.form['id']))

# Менеджеры
@app.route('/acp/managers/', methods=['GET'])
def acp_managers():
    managers = model.getManagers()
    return render_template('acp/managers.html', managers=managers)

@app.route('/acp/managers/edit/<path:manager_id>', methods=['GET'])
def acp_manager_edit(manager_id):
    managers = model.getManagers()
    return render_template('acp/edit_manager.html', manager=managers[int(manager_id)])

@app.route('/acp/managers/update', methods=['POST'])
def acp_manager_update():
    model.updateМanager(request.form.to_dict())
    return redirect(url_for('acp_manager_edit', manager_id=request.form['id']))


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=80)