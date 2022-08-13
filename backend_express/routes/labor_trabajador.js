var express = require('express');
var router = express.Router();
var bodyParser = require("body-parser");

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('labor_trabajador', { });
});

router.post('/labor_trabajador', function (req, res, next) {
  var labor = req.body.labor;
  var tarifa = req.body.tarifa;

  connect(function (err, client, done) {
    if (err) {
      return console.error("error fetching client from pool", err);
    }   
    client.query(
      `INSERT INTO Trabajador_Has_Labor(labor_id, t_h_l_precio) VALUES ('${req.body.labor}','${req.body.tarifa}');`
    );
  });
});

module.exports = router;