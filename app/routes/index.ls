
module.exports = (app) ->

    core = require \../controllers/core-server
    app.route \/
       .get core.index
