const { initializeDatabase, getDatabaseConnection } = require('./db')

initializeDatabase()
const db = getDatabaseConnection()

const queryString = 'INSERT INTO `the-pool-test`.`users` (`name`, `gender`, `email`, `phone_no`, `password`, `role`, `dob`)' + `VALUES ('${'name'}', '${'gender'}', '${'email'}', '${'phone'}', '${'password'}', '${'role'}', '${'1999-10-12'}');`

db.query(queryString, (error, rows) => {
  if (error) throw error
  if (rows.length) console.log(rows)
  db.close()
})
