from flask import Flask, render_template

app = Flask(__name__)

@app.route('/', methods=['GET'])
def main():
    return render_template('main.html')

@app.route('/acp/', methods=['GET'])
def acp():
    return render_template('acp/main.html')

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