from flask import Flask

app = Flask(__name__)

@app.route('/', methods=['GET'])
def main():
    return 'Claims V.2.0'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=80)