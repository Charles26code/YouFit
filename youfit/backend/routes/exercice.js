const express = require('express');

const router = express.Router();
const exerciceCtrl = require('../controllers/exercice');

// Routes
router.get('/', exerciceCtrl.getAllExercices);

module.exports = router;