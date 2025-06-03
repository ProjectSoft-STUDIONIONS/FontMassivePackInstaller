module.exports = function(grunt){
	process.removeAllListeners('warning');
	require('dotenv').config();
	require('load-grunt-tasks')(grunt);
	require('time-grunt')(grunt);

	var gc = {},
		pkg = grunt.file.readJSON('package.json'),
		path = require('path'),
		uniqid = function () {
			let result = URL.createObjectURL(new Blob([])).slice(-36).replace(/-/g, '');
			return result;
		};
	function getTasks() {
		switch(process.env.GRUNT_TASK){
			default:
				return [
					'imagemin',
					'tinyimg',
					'less',
					'autoprefixer',
					'cssmin',
					'uglify',
					'pug'
				];
		}
	}
	grunt.initConfig({
		globalConfig : gc,
		pkg : pkg,
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
						dest: 'docs/images/'
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
					'docs/css/main.css' : [
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
							"h1title": "FontMassive Pack Installer v" + pkg.version,
							"description": "Очень хороший набор программ. Особенно пользуюсь FontMassive и FonTemp, т. к. большую часть работаю с шаблонами, где используются сторонние шрифты, которых нет в системе.",
							"keywords": "ProjectSoft, STUDIONIONS, ProjectSoft-STUDIONIONS,FontMassive Pack Installer, FontMassivePack",
							"nickname": "ProjectSoft",
							"logotype": "projectsoft.png",
							"copyright": "2008 - all right reserved",
							"open_graph": {
								"image_16x9": "application.png",
								"image_16x9_width": "499",
								"image_16x9_height": "392",
								"image_1x1": "application.png",
								"image_1x1_width": "499",
								"image_1x1_height": "392",
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
	});
	grunt.registerTask('default', getTasks());
}