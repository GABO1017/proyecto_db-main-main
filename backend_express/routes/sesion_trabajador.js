var express = require('express');
var router = express.Router();
var bodyParser = require("body-parser");

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('sesion_trabajador', { title: 'Express' });
});

router.post("/sesion_trabajador", function (req, res, next) {
    const { email, password} = req.body;
        try {
        const Persona = await (
            pool.query(
            "SELECT * FROM Persona WHERE persona_email=$1 AND persona_password=$2",
            [email, password]
            )
        ).rows;
        if (Persona.length > 0) {
            res.status(200).json({
            email: Persona[0].persona_email,
            password: Persona[0].persona_password
            });
        } else {
            res.status(200).json({
            message: "El trabajador no esta registrado",
            NotFound: true,
            });
        }
        } catch (error) {
        res.status(500).json({
            message: "An error has ocured",
            error,
        });
    }
 });

module.exports = router;
