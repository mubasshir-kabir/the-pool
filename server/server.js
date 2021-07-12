const path = require("path");
const cors = require('cors');
const express = require("express");
const server = express();
const router = require('./routes/router')
const { initializeDatabase } = require('./db')

const PORT = 3080;

initializeDatabase()

//middleware
server.use(cors())
server.use(express.json())

//router
server.use('/api', router)

//sandbox-interface
// server.use("/sandbox", express.static(path.resolve(__dirname, "public")));

server.listen(PORT, () => console.log("Server Started at http://127.0.0.1:" + PORT));
