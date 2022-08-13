var express = require('express');
var router = express.Router();
var bodyParser = require("body-parser");

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('registro_trabajador', { });
});

router.post("/registro_trabajador", function (req, res, next) {
  var nombre = req.body.nombre;
  var apellido = req.body.apellido;
  var celular = req.body.celular;
  var nacimiento = req.body.nacimiento;
  var email = req.body.email;
  var direccion = req.body.direccion;
  var ciudad = req.body.ciudad;
  var password = req.body.password;
  var doc_id = req.body.doc_id;
  var fotoFile = req.body.fotoFile;
  connect(function (err, client, done) {
    if (err) {
      return console.error("error fetching client from pool", err);
    }
    client.query(
      `INSERT INTO Persona(persona_nombre, persona_apellido, persona_email, persona_password, persona_celular ) VALUES ('${req.body.nombre}', '${req.body.apellido}', '${req.body.email}', '${req.body.password}', '${req.body.celular}');`
    );
    client.query(
      `INSERT INTO Trabajador(trabajador_foto_id, trabajador_foto_perfil) VALUES ('${req.body.doc_id}', '${req.body.fotoFile}';`
    );
    client.query(
      `INSERT INTO Ubicacion(ubica_ciudad, ubica_direccion) VALUES('${req.body.ciudad}', '${req.body.direccion}';)`);
  });
});



module.exports = router;