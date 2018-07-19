from flask import Flask
app = Flask(__name__)

def foo(f):
    def bar():
        return 'foo'
        return f()
    bar.__name__ = f.__name__
    return bar

@app.route('/', methods=['GET'])
@foo
def main():
    return 'hello'

@app.route('/test', methods=['GET'])
@foo
def test():
    return 'hello'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=80)