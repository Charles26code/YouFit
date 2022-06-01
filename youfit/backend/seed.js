const mongoose = require("mongoose");
const exercice = require("./models/exercice");
const user = require("./models/user");

// Pour utiliser les images depuis le backend
// photo: 'http://localhost/assets/images/olivia.jpg',

mongoose
  .connect(
    "mongodb+srv://root:root@youfitcluster.okkcr.mongodb.net/?retryWrites=true&w=majority",
    {
      useNewUrlParser: true
    }
  )
  .then(() => {
    Promise.all([
      new exercice({
        name: 'CARDIO CIRCUIT',
        photo: 'img/fitness.jpg',
        description: 'Renforcer votre cardio en 8 semaines et gagner en explosivité, voici un test pour l\'extension du texte',
        difficulty: '1',
      }).save(),
      new exercice({
        name: 'RENFORCEMENT',
        photo: 'img/fitness.jpg',
        description: 'Renforcer votre cardio en 8 semaines et gagner en explosivité.',
        difficulty: '2',
      }).save(),
      new exercice({
        name: 'PERTE DE POIDS',
        photo: 'img/fitness.jpg',
        description: 'Renforcer votre cardio en 8 semaines et gagner en explosivité, voici un test pour l\'extension du texte',
        difficulty: '3',
      }).save(),
      new exercice({
        name: 'MUSCULATION',
        photo: 'img/fitness.jpg',
        description: 'Renforcer votre cardio en 8 semaines et gagner en explosivité.',
        difficulty: '1',
      }).save(),
    ]).then(res => {
      console.log("data installed");
      mongoose.connection.close();
    });
  });
