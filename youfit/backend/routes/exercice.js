const express = require('express');

const router = express.Router();
const exerciceCtrl = require('../controllers/exercice');

// Routes
router.get('/', exerciceCtrl.getAllExercices);
router.post('/getExercices', exerciceCtrl.getExercices);

module.exports = router;