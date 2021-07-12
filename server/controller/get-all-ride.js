const { getDatabaseConnection } = require('../db')

function getAllRide(req, res) {
  let db = getDatabaseConnection()

  const query = `SELECT * FROM rides`

  db.query(query, (error, rows) => {
    if (error) return res.send(error)
    res.json(rows)
  })
}

module.exports = getAllRide