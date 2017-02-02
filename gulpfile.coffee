# Minify our little file
gulp = require 'gulp'
coffee = require 'gulp-coffee'
uglify = require 'gulp-uglify'

gulp.task "default", ()->
  gulp.src "./main.coffee"
  .pipe coffee()
  .pipe uglify()
  .pipe gulp.dest "./dist/"
