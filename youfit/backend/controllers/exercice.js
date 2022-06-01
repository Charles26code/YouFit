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

exports.createExercice = (req, res, next) => {
  const exo = new Exercice({
    name: req.body.name,
    description: req.body.description,
    difficulty: req.body.difficulty,
    photo: req.body.photo,
  });
  exo.save().then(
    () => res.status(200).json(
      {message: 'Le programme a été créé'}
      )
    ).catch(
      error => res.status(400).json(
        {message: "Erreur serveur, le programme n'a pas été créé."}
      )
    );
};