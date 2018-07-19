import sys

# MODE
mode = 'prod' if len(sys.argv) > 1 and sys.argv[1] == 'prod' else 'test'

# APP
APP_PARAMS = {
    'test': {
        'debug': True,
        'host': '0.0.0.0',
        'port': 80
    },
    'prod': {
        'debug': False,
        'host': '0.0.0.0',
        'port': 5000
    }
}

APP_CURRENT_PARAMS = APP_PARAMS[mode]

# ACP
ACP_CONFIG = {
    'test': {
        'password': '123',
        'cookie_lifetime': {'days': 30}
    },
    'prod': {
        'password': '123',
        'cookie_lifetime': {'days': 30}
    }
}
ACP_CURRENT_CONFIG = ACP_CONFIG[mode]

# DB
DB_CONNECT_PARAMS = {
    'test': {
        'host': 'localhost',
        'db': 'claims',
        'user': 'root',
        'password': 'root',
        'charset': 'utf8mb4'
    },
    'prod': {
        'host': 'localhost',
        'db': 'claims',
        'user': 'root',
        'password': 'root',
        'charset': 'utf8mb4'
    }
}

DB_CURRENT_CONNECT_PARAMS = DB_CONNECT_PARAMS[mode]