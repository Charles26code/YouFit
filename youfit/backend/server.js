const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const app = express();
const path = require("path");
const Exercice = require("./models/exercices.model");

app.use(cors());
mongoose.set("debug", true);
mongoose
  .connect(
    "mongodb+srv://Cnam:Cnam2022@cluster0.sq0an.mongodb.net/?retryWrites=true&w=majority",
    {
      useNewUrlParser: true,
      useUnifiedTopology: true
    }
  )
  .then(() => console.log("connexion ok !"));

app.use(express.static(path.join(__dirname, "public")));
app.use(express.json());


app.get("/api/exercices", async (req, res) => {
  try {
    const exercices = await Exercice.find({}).exec();
    res.json(exercices);
  } catch (e) {
    res.status(500).json(e);
  }
});

app.post("/api/exercices", async (req, res) => {
  try {
    const body = req.body;
    const exercice = await new Exercice(body).save();
    res.json(trip);
  } catch (e) {
    res.status(500).json(e);
  }
});



app.listen(80);
