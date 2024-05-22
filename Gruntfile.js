module.exports = function(grunt){
	require('load-grunt-tasks')(grunt);
	require('time-grunt')(grunt);
	var gc = {};
	grunt.initConfig({
		globalConfig : gc,
		pkg : grunt.file.readJSON('package.json'),
		imagemin: {
			base: {
				options: {
					optimizationLevel: 3,
					svgoPlugins: [
						{
							removeViewBox: false
						}
					]
				},
				files: [
					{
						expand: true,
						flatten : true,
						src: [
							'src/images/*.{png,jpg,gif}'
						],
						dest: 'test/images/',
						filter: 'isFile'
					}
				],
			}
		},
		tinyimg: {
			dynamic: {
				files: [
					{
						expand: true,
						cwd: 'test/images', 
						src: ['**/*.{png,jpg,jpeg}'],
						dest: 'docs/assets/images/'
					}
				]
			}
		},
		less: {
			main: {
				options : {
					compress: false,
					ieCompat: false
				},
				files: {
					'test/css/main.css': [
						
						'src/less/main.less'
					],
				}
			}
		},
		autoprefixer:{
			options: {
				browsers: ["last 10 version"],//['Chrome > 70']
				cascade: true
			},
			css: {
				files: {
					'tests/css/main.css' : ['test/css/main.css'],
				}
			},
		},
		cssmin: {
			options: {
				mergeIntoShorthands: false,
				roundingPrecision: -1
			},
			minify: {
				files: {
					'docs/assets/css/main.css' : [
						'tests/css/main.css'
					],
				}
			}
		},
		pug: {
			files: {
				options: {
					pretty: '\t',
					separator:  '\n'
				},
				files: {
					"docs/index.html": ['src/pug/index.pug'],
				}
			}
		},
		uglify : {
			options: {
				ASCIIOnly: true,
			},
			main: {
				files: {
					'test/js/main.js': [
						'bower_components/jquery/dist/jquery.js',
						'src/js/main.js'
					]
				}
			},
		},
		bower_server: {
			develop: {
				options: {
					//api: './mock',
					port: 3003,
					base: 'docs/',
					release: false
				}
			}
		},
		watch: {
			options: {
				livereload: true,
			},
			compile: {
				files: [
					'src/**/*.*'
				],
				tasks: [
					'imagemin',
					'tinyimg',
					'less',
					'autoprefixer',
					'cssmin',
					'uglify',
					'pug',
				]
			}
		},
	});
	grunt.registerTask('default', [
		'imagemin',
		'tinyimg',
		'less',
		'autoprefixer',
		'cssmin',
		'uglify',
		'pug'
	]);
	grunt.registerTask('develop', [
		'watch',
	]);
	grunt.registerTask('server', [
		'bower_server',
	]);
}