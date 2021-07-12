const mariadb = require('mariadb/callback');

let _db;

const options = {
  host: '127.0.0.1',
  user: 'root',
  password: '1234',
  database: 'the-pool-test'
}

function initializeDatabase() {
  if (!_db) {
    _db = mariadb.createConnection(options)
  }
}

function getDatabaseConnection() {
  if (_db) return _db
  initializeDatabase();
  return _db;
}

module.exports = { initializeDatabase, getDatabaseConnection }