var express = require('express');
var router = express.Router();
var bodyParser = require("body-parser");

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('registro_usuario', { });
});

router.post("/registro_usuario", function (req, res, next) {
  var nombre = req.body.nombre;
  var apellido = req.body.apellido;
  var celular = req.body.celular;
  var nacimiento = req.body.nacimiento;
  var email = req.body.email;
  var direccion = req.body.direccion;
  var ciudad = req.body.ciudad;
  var password = req.body.password;
  var myFile = req.body.myFile;
  connect(function (err, client, done) {
    if (err) {
      return console.error("error fetching client from pool", err);
    }
    client.query(
      `INSERT INTO Persona(persona_nombre, persona_apellido, persona_email, persona_password, persona_celular ) VALUES ('${req.body.nombre}', '${req.body.apellido}', '${req.body.email}', '${req.body.password}', '${req.body.celular}');`
    );
    client.query(
      `INSERT INTO Cliente(cliente_recibo) VALUES ('${req.body.myFile}';`
    );
    client.query(
      `INSERT INTO Ubicacion(ubica_ciudad, ubica_direccion) VALUES('${req.body.ciudad}', '${req.body.direccion}';)`
      );
  });
});

module.exports = router;