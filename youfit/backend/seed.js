const mongoose = require("mongoose");
const exercice = require("./models/exercices.model");
const user = require("./models/user");

// Pour utiliser les images depuis le backend
// photo: 'http://localhost/assets/images/olivia.jpg',

mongoose
  .connect(
    "mongodb+srv://test:test@youfitcluster.okkcr.mongodb.net/?retryWrites=true&w=majority",
    {
      useNewUrlParser: true
    }
  )
  .then(() => {
    Promise.all([
      new exercice({
        name: 'Push ups',
        photo: 'img/fitness.jpg',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        difficulty: 'Easy',
      }).save(),
      new exercice({
        name: 'Pull ups',
        photo: 'img/fitness.jpg',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        difficulty: 'Easy',
      }).save(),
      new exercice({
        name: 'Australian Pull ups',
        photo: 'img/fitness.jpg',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        difficulty: 'Easy',
      }).save(),
      new exercice({
        name: 'Handstand',
        photo: 'img/fitness.jpg',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        difficulty: 'Medium',
      }).save(),
      new exercice({
        name: 'Front Lever',
        photo: 'img/fitness.jpg',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        difficulty: 'Hard',
      }).save(),,
      new user({
        username: "Sofiane",
        email: "Sofiane@RADJAH.fr",
        password: "123456",
      }).save()

    ]).then(res => {
      console.log("data installed");
      mongoose.connection.close();
    });
  });
