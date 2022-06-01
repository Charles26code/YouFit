const express = require('express');

const router = express.Router();
const favorisCtrl = require('../controllers/favoris');

// Routes
router.post('/getFavorisForOneUser', favorisCtrl.getFavorisForOneUser);

module.exports = router;