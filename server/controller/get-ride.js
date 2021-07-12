const { getDatabaseConnection } = require('../db')

function getRide(req, res) {
  let db = getDatabaseConnection()

  const query = `SELECT * FROM rides WHERE r_id = ${req.body.ride_id}`

  db.query(query, (error, rows) => {
    if (error) return res.send(error)
    res.json(rows)
  })
}

module.exports = getRide