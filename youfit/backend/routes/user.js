const express = require('express');

const router = express.Router();
const userCtrl = require('../controllers/user');

// Routes
router.get('/', userCtrl.getAllUsers);
router.get('/:id', userCtrl.getOneUser);
router.post('/add', userCtrl.createUser);
router.post('/login', userCtrl.login);
router.post('/changepassword', userCtrl.changePassword)

module.exports = router;