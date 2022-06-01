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

exports.addFavoris = (req, res, next) => {
  const favoris = new Favoris({
    userId: req.body.userId,
    exerciceId: req.body.exerciceId,
  });
  favoris.save().then(
    () => res.status(200).json(
      {message: 'Ajouté au favoris.'}
      )
    ).catch(
      error => res.status(400).json(
        {error: error}
      )
    );
};

exports.removeFavoris = (req, res, next) => {
  Favoris.deleteOne({userId : req.body.userId, exerciceId : req.body.exerciceId}).then(
    (favoris) => {
        res.status(200).json({
          message: 'Retiré des favoris'
        })
    }
  ).catch(
    (error) => {
      res.status(400).json({
        error: error
      });
    }
  );
};