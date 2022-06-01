const mongoose = require("mongoose");
const uniqueValidator = require('mongoose-unique-validator');

const favorisSchema = mongoose.Schema({
  userId: { type: String, required: true },
  exerciceId: { type: String, required: true },
});

exerciceSchema.plugin(uniqueValidator);

module.exports = mongoose.model("favoris", favorisSchema);