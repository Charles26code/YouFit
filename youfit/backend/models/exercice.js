const mongoose = require("mongoose");
const uniqueValidator = require('mongoose-unique-validator');

const exerciceSchema = mongoose.Schema({
  name: { type: String, required: true },
  photo: { type: String, required: true },
  description: { type: String, required: true },
  difficulty: { type: String, required: true },
});

exerciceSchema.plugin(uniqueValidator);

module.exports = mongoose.model("exercice", exerciceSchema);

