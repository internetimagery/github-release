# Minify our little file
gulp = require 'gulp'
coffee = require 'gulp-coffee'
uglify = require 'gulp-uglify'

gulp.task "default", ()->
  gulp.src "./src/*.coffee"
  .pipe coffee()
  .pipe uglify()
  .pipe gulp.dest "./dist/"
