const { getDatabaseConnection } = require('../db')

function makeBid(req, res) {
  let db = getDatabaseConnection()
  const { bidder_id, ride_id, bid_message } = req.body

  const query = `INSERT INTO ride_bids (bidder_id, ride_id, bid_message) VALUES ("${bidder_id}", "${ride_id}", "${bid_message}")`

  db.query(query, (error, rows) => {
    if (error) return res.send(error)
    res.json(rows)
  })
}

module.exports = makeBid