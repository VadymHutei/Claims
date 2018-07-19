import pymysql.cursors
import conf

class DB:

    def __init__(self):
        self.param = conf.DB_CURRENT_CONNECT_PARAMS
        self.param.update({'cursorclass': pymysql.cursors.DictCursor})

    def run_query(self, query, data=()):
        connection = pymysql.connect(**self.param)
        try:
            with connection.cursor() as cursor:
                cursor.execute(query, data)
                connection.commit()
                result = True
        except Exception as e:
            print(e)
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