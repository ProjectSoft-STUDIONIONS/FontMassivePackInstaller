module.exports = function(grunt) {
	const fs = require("fs");
	const path = require("path");
	grunt.registerMultiTask('version_edit', 'Version Update FontMassive Pack', async function() {
		var done = this.async();
		const pkg = this.options().pkg;
		grunt.file.write("version.iss", `#define AppVersion "${pkg.version}"`);
		done();
	});
}