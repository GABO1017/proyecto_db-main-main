var express = require('express');
var router = express.Router();
var bodyParser = require("body-parser");

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('sesionIniciada_usuario', { title: 'Express' });
});

module.exports = router;
