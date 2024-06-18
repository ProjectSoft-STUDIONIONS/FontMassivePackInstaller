module.exports = function(grunt){
	process.removeAllListeners('warning');
	require('dotenv').config();
	require('load-grunt-tasks')(grunt);
	require('time-grunt')(grunt);
	grunt.loadNpmTasks('innosetup-compiler');
	require('./modules/Versions.js')(grunt);
	require('./modules/Downloader.js')(grunt);

	var gc = {},
		pkg = grunt.file.readJSON('package.json'),
		path = require('path'),
		uniqid = function () {
			let result = URL.createObjectURL(new Blob([])).slice(-36).replace(/-/g, '');
			return result;
		};
	function getTasks() {
		switch(process.env.GRUNT_TASK){
			case "develop":
				return [
					'watch'
				];
			case "server":
				return [
					'bower_server'
				];
			default:
				return [
					'version_edit',
					'downloader',
					'imagemin',
					'tinyimg',
					'less',
					'autoprefixer',
					'cssmin',
					'uglify',
					'pug',
					'innosetup'
				];
		}
	}
	grunt.initConfig({
		globalConfig : gc,
		pkg : pkg,
		downloader: {
			base: {}
		},
		version_edit: {
			default: {
				options: {
					pkg: pkg,
				}
			}
		},
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
					separator:  '\n',
					// https://projectsoft-studionions.github.io/FontMassivePackInstaller/
					data: function(dest, src) {
						return {
							"hash": uniqid(),
							"repo": "projectsoft-studionions.github.io",
							"userName": "ProjectSoft-STUDIONIONS",
							"page": "FontMassivePackInstaller",
							"download": "FontMassivePack.exe",
							"title": "FontMassive Pack Installer | ProjectSoft GitHub Pages",
							"h1title": "FontMassive Pack Installer",
							"description": "Очень хороший набор программ. Особенно пользуюсь FontMassive и FonTemp, т. к. большую часть работаю с шаблонами, где используются сторонние шрифты, которых нет в системе.",
							"keywords": "ProjectSoft, STUDIONIONS, ProjectSoft-STUDIONIONS,FontMassive Pack Installer, FontMassivePack",
							"nickname": "ProjectSoft",
							"logotype": "projectsoft.png",
							"copyright": "2008 - all right reserved",
							"open_graph": {
								"image_16x9": "image16x9.jpg",
								"image_16x9_width": "1920",
								"image_16x9_height": "1080",
								"image_1x1": "image1x1.jpg",
								"image_1x1_width": "1080",
								"image_1x1_height": "1080",
							}
						}
					}
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
		innosetup: {
			default: {
				options: {
					gui: false,
					verbose: true,
				},
				script: __dirname + "/setup.iss"
			}
		},
		bower_server: {
			develop: {
				options: {
					//api: './mock',
					port: 3003,
					base: 'docs/',
					release: true,
					config: true
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
	grunt.registerTask('default', getTasks());
}