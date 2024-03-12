const PORT = process.env.PORT || 8080;

require("dotenv").config();
const express = require("express"),
  http = require("http"),
  app = express(),
  launcher = require("rocket-server-log");

const env = process.env.ENV;
console.log(`env; ${env}`);
app.use(express.static(__dirname + "/public"));

// create server
const server = http.createServer(app);

app.get("/env-api", function(req, res) {
  console.log(`env; ${env}`);
  res.send(`This is your super secret environment variable: ${env}!`);
});

server.listen(PORT, function() {
  launcher(PORT);
});
