const Exercice = require('../models/exercice');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');


exports.getAllExercices = (req, res, next) => {
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

exports.getExercices = (req, res, next) => {
  Exercice.find({_id : req.body.ids}).then(
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