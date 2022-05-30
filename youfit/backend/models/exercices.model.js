const mongoose = require("mongoose");
const schema = mongoose.Schema;

const exerciceSchema = schema({
  name: { type: String, required: true },
  photo: { type: String, required: true },
  description: { type: String, required: true },
  difficulty: { type: String, required: true },
});

const YouFit = mongoose.model("exercices", exerciceSchema);

module.exports = YouFit;

