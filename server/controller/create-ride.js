const { getDatabaseConnection } = require('../db')

function cerateRide(req, res) {
  let db = getDatabaseConnection()
  const { from_location, to_location, event_date, event_time, price, additional_msg, rider_id } = req.body

  const query = `INSERT INTO rides (from_location, to_location, event_date, event_time, price, additional_message, rider_id) VALUES ("${from_location}", "${to_location}", "${event_date}", "${event_time}", "${price}", "${additional_msg}", "${rider_id}")`

  db.query(query, (error, rows) => {
    if (error) return res.send(error)
    res.json(rows)
  })
}

module.exports = cerateRide