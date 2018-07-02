import datetime
from random import choice
from flask import Flask, render_template, request, redirect, url_for, make_response



# Variables
ACP_PASSWORD = '123'
tokens = []
app = Flask(__name__)



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

@app.route('/acp/', methods=['GET'])
def acp():
    if not isAuth():
        return redirect(url_for('acp_login'))
    return render_template('acp/main.html')

@app.route('/acp/login', methods=['GET'])
def acp_login():
    return render_template('acp/login.html')

@app.route('/acp/auth', methods=['POST'])
def acp_auth():
    if auth():
        return login()
    return redirect(url_for('acp_login'))

@app.route('/acp/stores/', methods=['GET'])
def acp_stores():
    return 'stores'

@app.route('/acp/stores/<path:store_id>', methods=['GET'])
def acp_store(store_id):
    return 'store {store_id}'.format(store_id=store_id)

@app.route('/acp/managers/', methods=['GET'])
def acp_managers():
    return 'managers'

@app.route('/acp/managers/<path:manager_id>', methods=['GET'])
def acp_manager(manager_id):
    return 'manager {manager_id}'.format(manager_id=manager_id)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=80)