'use strict';
require! {
    \gulp
    'gulp-run': run
    'browser-sync': browserSync
}

gulp.task \browser-sync, [\run] !->
    browser-sync.init null,
        proxy: \localhost:3000
        port : 9000
        open : false

gulp.task \run, ->
    run('lsc -w app.ls').exec!

gulp.task \watch !->
    gulp.watch \public/css/*.styl, !->
        browserSync.reload \live.css, stream: true

gulp.task \default <[ browser-sync watch ]>
