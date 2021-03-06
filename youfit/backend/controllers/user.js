const User = require('../models/user');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');



exports.getOneUser = (req, res, next) => {
  User.findOne({
      _id: req.params.id
  }).then(
    () => {
      res.status(200).json(user);
    }
  ).catch(
    (error) => {
      res.status(400).json({
        error: error
      });
    }
  );
};

exports.getAllUsers = (req, res, next) => {
  User.find().then(
    (users) => {
      res.status(200).json(users);
    }
  ).catch(
    (error) => {
      res.status(400).json({
        error: error
      });
    }
  );
};

exports.createUser = (req, res, next) => {
  bcrypt.hash(req.body.password, 10).then(hash => {
    const user = new User({
      username: req.body.username,
      email: req.body.email,
      password: hash,
    });
    user.save().then(
      () => res.status(200).json(
        {message: 'Votre compte a été créé.'}
        )
      ).catch(
        error => res.status(400).json(
          {error: error}
        )
      );
  }).catch(error => res.status(400).json({error: error}));
}


exports.login = (req, res, next) => {
  User.findOne({ $or: [{email: req.body.mailusername}, {username: req.body.mailusername}] })
    .then(user => {
      if (!user) {
        return res.status(401).json({ error: 'Aucun utilisateur n\'est enregistré avec cet email ou avec ce nom d\'utilisateur.' });
      }
      bcrypt.compare(req.body.password, user.password)
        .then(valid => {
          if (!valid) {
            return res.status(401).json({ error: "Le mot de passe est incorrect" });
          }
          res.status(200).json({
            user: user,
          });
        })
        .catch(error => res.status(500).json({ error }));
    })
    .catch(error => res.status(500).json({ error }));
};

exports.changePassword = (req, res, next) => {
  User.findOne({ $or: [{email: req.body.mailusername}, {username: req.body.mailusername}] })
    .then(user => {
      if (!user) {
        return res.status(401).json({ error: 'Aucun utilisateur n\'est enregistré avec cet email' });
      }
      bcrypt.hash(req.body.password, 10).then(hash => {
        user['password'] = hash;
        user.save().then(
          () => res.status(200).json(
            {message: 'Le mot de passe a été changé.'}
            )
          ).catch(
            error => res.status(400).json(
              {error: error}
            )
          );
      }).catch(error => res.status(400).json({error: error}));
    })
    .catch(error => res.status(500).json({ error }));
};