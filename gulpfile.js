(function() {
  var coffee, gulp, uglify;

  gulp = require('gulp');

  coffee = require('gulp-coffee');

  uglify = require('gulp-uglify');

  gulp.task("default", function() {
    return gulp.src("./main.coffee").pipe(coffee()).pipe(uglify()).pipe(gulp.dest("./dist/"));
  });

}).call(this);
