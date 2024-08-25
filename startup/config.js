const config = require("config");
const jwtPrivateKey = config.get("jwtPrivateKey");
module.exports = function () {
  if (!jwtPrivateKey) {
    throw new Error("FATAL ERROR: jwtPrivateKey is not defined.");
  }
};
