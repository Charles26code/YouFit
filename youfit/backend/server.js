const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const app = express();
const path = require("path");
const Exercice = require("./models/exercices.model");
const User = require("./models/user");
const userRoutes = require("./routes/user");

app.use(cors());
mongoose.set("debug", true);
mongoose
  .connect(
    "mongodb+srv://test:test@youfitcluster.okkcr.mongodb.net/?retryWrites=true&w=majority",
    {
      useNewUrlParser: true,
      useUnifiedTopology: true
    }
  )
  .then(() => console.log("connexion ok !"));

app.use(express.static(path.join(__dirname, "public")));
app.use(express.json());

//Récup tous les exercices
app.get("/api/exercices", async (req, res) => {
  try {
    const exercices = await Exercice.find({}).exec();
    res.json(exercices);
  } catch (e) {
    res.status(500).json(e);
  }
});

app.use('/api/users', userRoutes);

/*//Récup tous les utilisateurs
app.get("/api/users", async (req, res) => {
  try {
    const users = await User.find({}).exec();
    res.json(users);
  } catch (e) {
    res.status(500).json(e);
  }
});*/

/*app.post("/api/exercices", async (req, res) => {
  try {
    const body = req.body;
    const exercice = await new Exercice(body).save();
    res.json(trip);
  } catch (e) {
    res.status(500).json(e);
  }
});*/



app.listen(80);
