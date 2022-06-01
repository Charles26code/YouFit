const Favoris = require('../models/favoris');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');


exports.getFavorisForOneUser = (req, res, next) => {
  Favoris.find({userId : req.body.userId}).then(
    (favoris) => {
      res.status(200).json(favoris);
    }
  ).catch(
    (error) => {
      res.status(400).json({
        error: error
      });
    }
  );
};