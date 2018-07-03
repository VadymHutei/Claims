import datetime
from claims_db import DB

class Model():

    def __init__(self):
        self.db = DB()
        self._stores = {}
        self._claims = {}
        self._managers = {}
        self._getStores()
        self._getClaims()
        self._getManagers()

    def _getStores(self):
        query = "SELECT * FROM `stores`"
        data = self.db.array_query(query)
        if data is not None:
            for row in data:
                self._stores[row['id']] = row
        self._stores_last_update = datetime.datetime.now()

    def _getClaims(self):
        query = "SELECT * FROM `claims`"
        data = self.db.array_query(query)
        if data is not None:
            for row in data:
                self._claims[row['id']] = row
        self._claims_last_update = datetime.datetime.now()

    def _getManagers(self):
        query = "SELECT * FROM `managers`"
        data = self.db.array_query(query)
        if data is not None:
            for row in data:
                self._managers[row['id']] = row
        self._managers_last_update = datetime.datetime.now()

    def getStores(self):
        if datetime.datetime.now() - self._stores_last_update >= datetime.timedelta(minutes=15):
            self._getStores()
        return self._stores

    def getClaims(self):
        if datetime.datetime.now() - self._claims_last_update >= datetime.timedelta(minutes=15):
            self._getClaims()
        return self._claims

    def getManagers(self):
        if datetime.datetime.now() - self._managers_last_update >= datetime.timedelta(minutes=15):
            self._getManagers()
        return self._managers

    def updateStore(self, data):
        query = "UPDATE `stores` SET `title` = %s, `city` = %s, `link` = %s, `manager_id` = %s, `franchisee` = %s WHERE `id` = %s"
        params = (
            data.get('title', ''),
            data.get('city', ''),
            data.get('link', ''),
            data.get('manager_id', ''),
            'Y' if data.get('franchisee', False) else 'N',
            data.get('id', '')
        )
        result = self.db.run_query(query, params)
        self._getStores()

    def updateМanager(self, data):
        query = "UPDATE `managers` SET `name` = %s, `position` = %s, `email` = %s, WHERE `id` = %s"
        params = (
            data.get('name', ''),
            data.get('position', ''),
            data.get('email', ''),
            data.get('id', '')
        )
        result = self.db.run_query(query, params)
        self._getManagers()

    def log(self, title, text):
        date = datetime.datetime.now()
        query = "INSERT INTO `logs` (`date`, `title`, `text`) VALUES (%s, %s, %s)"
        self.db.run_query(query, (date, title, text))

    def addAdminSession(self, user_agent):
        log_data = ('AdminSession', 'User-Agent: ' + user_agent)
        self.log(*log_data)