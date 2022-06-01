const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const app = express();
const path = require("path");
const userRoutes = require("./routes/user");
const exerciceRoutes = require("./routes/exercice");
const favorisRoutes = require("./routes/favoris");

app.use(cors());
mongoose.set("debug", true);
mongoose
  .connect(
    "mongodb+srv://root:root@youfitcluster.okkcr.mongodb.net/?retryWrites=true&w=majority",
    {
      useNewUrlParser: true,
      useUnifiedTopology: true
    }
  )
  .then(() => console.log("connexion ok !"));

app.use(express.static(path.join(__dirname, "public")));
app.use(express.json());

app.use('/api/users', userRoutes);
app.use('/api/exercices', exerciceRoutes);
app.use('/api/favoris', favorisRoutes);



app.listen(80);
