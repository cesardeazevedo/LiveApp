global <<< require \prelude-ls
require! {
    \express
    \harp
    \glob
    'morgan': logger
    \body-parser
    \cookie-parser
    'method-override': method
}

module.exports = (app) !->

    app.set "views" "./app/views"
    app.set "view engine" "jade"
    app.use logger 'dev'
    app.use bodyParser.json!
    app.use bodyParser.urlencoded do
        * extended: true

    app.use method!
    app.use cookieParser!

    app.use express.static  root + \/public
    app.use harp.mount root + \/public

    routes = glob.sync "#root/app/routes/*.ls"
    map ((route) !-> require(route)(app)), routes

    app.use = (err, req, res, next) ->
        err = new Error 'not found'
        err.status = 404
        next err

    app.use = (err, req, res, next) ->

        res.status(err.status or 500)
        res.render \error,
            message: err.message
            error: err
            title: \error
