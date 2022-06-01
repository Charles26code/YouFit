const mongoose = require("mongoose");
const exercice = require("./models/exercice");
const user = require("./models/user");
const favoris = require("./models/favoris");

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
      new favoris({
        userId: '62948a1d90501444c4ec0759',
        exerciceId: '62971c3f47ee68ed1850693e',
      }).save(),
    ]).then(res => {
      console.log("data installed");
      mongoose.connection.close();
    });
  });
