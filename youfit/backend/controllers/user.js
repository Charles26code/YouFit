const User = require('../models/user');
//const bcrypt = require('bcrypt');
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

/*exports.createUser = (req, res, next) => {
  bcrypt.hash(req.body.password, 10)
  .then(hash => {
  const user = new User({
    email: req.body.email,
    password: hash,
  });
  user.save()
  .then(() => res.status(201).json({message: 'Nouvel utilisateur créé'})).
  catch(error => res.status(400).json({error: error}));
})
.catch(error => res.status(500).json({error: error}));
};*/
  
/*exports.createUser = (req, res, next) => {
  bcrypt.hash(req.body.password, 10)
  .then(hash => {
  const user = new User({
    email: req.body.email,
    password: hash,
  });
  user.save()
  .then(() => res.status(201).json({message: 'Nouvel utilisateur créé'})).
  catch(error => res.status(400).json({error: error}));
})
.catch(error => res.status(500).json({error: error}));
};*/


exports.login = (req, res, next) => {
  User.findOne({ email: req.body.email })
    .then(user => {
      if (!user) {
        return res.status(401).json({ error: 'Aucun utilisateur n\'est enregistré avec cet email' });
      }
      if(req.body.password != user.password){
        return res.status(401).json({ error: 'Le mot de passe saisi est incorrect' });
      }
      return res.status(200).json(user);
    })
    .catch(error => res.status(500).json({ error }));
};
