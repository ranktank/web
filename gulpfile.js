var _ = require('underscore')
var path = require('path');
var gulp = require('gulp')
var gutil = require('gulp-util');
var less = require('gulp-less');
var source = require('vinyl-source-stream');
var watchify = require('watchify');
var browserify = require('browserify');
var browserSync = require('browser-sync');

function getBrowserify(options) {
  options = options || {};

  return browserify('.', _.extend({
    extensions: ['.coffee']
  }, options));
}

function bundleBrowserify(bundler) {
  return bundler.bundle()
  .on('error', gutil.log.bind(gutil, gutil.colors.red('Browserify Error')))
  .pipe(source('bundle.js'))
  .pipe(gulp.dest('./dist'));
}

gulp.task('browserify', function() {
  return bundleBrowserify(getBrowserify());
});

gulp.task('watchify', function() {
  var bundler = watchify(getBrowserify(watchify.args));
  var bundle = bundleBrowserify.bind(null, bundler)

  bundler.on('update', bundle);

  bundler.on('update', function(ids) {
    gutil.log([
      gutil.colors.green('Updating Bundle...')
    ].concat(ids.map(function(id) {
      return '-> ' + id;
    })).join('\n'));
  });

  bundler.on('log', gutil.log.bind(gutil, gutil.colors.green('Bundle Updated')));

  return bundle();
});

gulp.task('less', function() {
  gulp.src('./app/styles/main.less')
  .pipe(less({
    paths: [path.join(__dirname, 'node_modules', 'bootstrap', 'less')]
  }))
  .pipe(gulp.dest('./dist'));
});

gulp.task('browser-sync', function() {
  browserSync({
    server: {
      baseDir: ['app', 'dist']
    }
  });
});

gulp.task('serve', ['watchify', 'browser-sync'], function() {
  gulp.watch(['app/styles/**/*.less'], ['less']);
  gulp.watch(['dist/**/*', 'app/**/*.html'], browserSync.reload);
});

gulp.task('build', ['browserify', 'less']);

gulp.task('default', ['build']);
