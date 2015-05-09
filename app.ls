'use strict';
require! {
    \path
    \express
}

global.root = path.normalize __dirname

app = express!

require(\./config/express)(app)

(process.env.PORT or 3000) |> app.listen
