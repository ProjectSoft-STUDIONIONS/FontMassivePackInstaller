module.exports = function(grunt){
	process.removeAllListeners('warning');
	require('dotenv').config();
	require('time-grunt')(grunt);
	grunt.loadNpmTasks('innosetup-compiler');
	require('./modules/Versions.js')(grunt);
	require('./modules/Downloader.js')(grunt);

	var gc = {},
		pkg = grunt.file.readJSON('package.json');
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
		innosetup: {
			default: {
				options: {
					gui: false,
					verbose: true,
				},
				script: __dirname + "/setup.iss"
			}
		},
	});
	grunt.registerTask('default', [
		'version_edit',
		'downloader',
		'innosetup'
	]);
}