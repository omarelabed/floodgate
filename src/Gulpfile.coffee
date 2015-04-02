coffee = require('gulp-coffee')

config =
	coffee:
		src: 'src/coffee/**/*.coffee'
		dest: 'dist/js'
		options:
			bare: true

gulp.task 'default', ->
	gulp.src config.coffee.src
		.pipe coffee config.coffee.options
		.pipe gulp.dest config.coffee.dest