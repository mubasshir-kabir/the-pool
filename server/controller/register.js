const { getDatabaseConnection } = require('../db')

function register(req, res) {
  let db = getDatabaseConnection()
  const { name, gender, email, phone, password, dob, role } = req.body

  const query = `INSERT INTO users (name, gender, email, phone_no, password, role, dob) VALUES ("${name}", "${gender}", "${email}", "${phone}", "${password}", "${role}", "${dob}")`

  db.query(query, (error, rows) => {
    if (error) return res.send(error)
    res.json(rows)
  })
}

module.exports = register