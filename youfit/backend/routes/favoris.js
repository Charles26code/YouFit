const express = require('express');

const router = express.Router();
const favorisCtrl = require('../controllers/favoris');

// Routes
router.post('/getFavorisForOneUser', favorisCtrl.getFavorisForOneUser);
router.post('/add', favorisCtrl.addFavoris);
router.post('/remove', favorisCtrl.removeFavoris);

module.exports = router;