const express = require('express')
const router = express.Router()

//controller
const register = require('../controller/register')
const cerateRide = require('../controller/create-ride')
const getAllRide = require('../controller/get-all-ride')
const getRide = require('../controller/get-ride')
const makeBid = require('../controller/make-bid')

//endpoints
router.post('/register', register)
router.post('/create-ride', cerateRide)
router.get('/get-all-ride', getAllRide)
router.post('/get-ride', getRide)
router.post('/make-bid', makeBid)

module.exports = router