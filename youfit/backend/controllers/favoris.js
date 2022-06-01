const Favoris = require('../models/favoris');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');


exports.getFavorisForOneUser = (req, res, next) => {
  Exercice.find().then(
    (exercices) => {
      res.status(200).json(exercices);
    }
  ).catch(
    (error) => {
      res.status(400).json({
        error: error
      });
    }
  );
};