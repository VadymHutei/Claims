import pymysql.cursors

class DB:

    def __init__(self):
        self.param = {
            'host': 'localhost',
            'db': 'claims',
            'user': 'root',
            'password': 'root',
            'charset': 'utf8mb4',
            'cursorclass': pymysql.cursors.DictCursor
        }

    def run_query(self, query, data=()):
        connection = pymysql.connect(**self.param)
        try:
            with connection.cursor() as cursor:
                cursor.execute(query, data)
                connection.commit()
                result = True
        except:
            result = False
        finally:
            connection.close()
        return result

    def array_query(self, query, data=()):
        self.conn = pymysql.connect(**self.param)
        connection = pymysql.connect(**self.param)
        try:
            with connection.cursor() as cursor:
                cursor.execute(query, data)
                result = cursor.fetchall()
        except:
            result = None
        finally:
            connection.close()
        return result