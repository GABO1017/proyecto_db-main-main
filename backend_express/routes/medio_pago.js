var express = require('express');
var router = express.Router();
var bodyParser = require("body-parser");

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('medio_pago', { });
});


router.post("/medio_pago", function (req, res, next) {
  var numTarjeta = req.body.numTarjeta;
  var cvc = req.body.cvc;
  connect(function (err, client, done) {
    if (err) {
      return console.error("error fetching client from pool", err);
    }
    client.query(
      `INSERT INTO Persona(persona_tarjeta_usuario, persona_cvc) VALUES ('${req.body.nombre}', '${req.body.apellido}', '${req.body.email}', '${req.body.password}', '${req.body.celular}');`
    );
  });
});

module.exports = router;