const express = require('express');

const router = express.Router();
const exerciceCtrl = require('../controllers/exercice');

// Routes
router.get('/', exerciceCtrl.getAllExercices);
router.post('/getExercices', exerciceCtrl.getExercices);
router.post('/add', exerciceCtrl.createExercice);

module.exports = router;