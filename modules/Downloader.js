module.exports = function(grunt) {
	//process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0';
	const supportsColor = require("supports-color");
	const fs = require("fs");
	const path = require("path");
	const { DownloaderHelper } = require('node-downloader-helper');
	const cliProgress = require('cli-progress');
	const _colors = require('ansi-colors');
	const zl = require("zip-lib");
	const colorEnb = typeof supportsColor.stdout == 'object' ? true : false;
	grunt.registerMultiTask('downloader', 'Downloads FontMassive Pack', async function() {
		var done = this.async();
		const pkg = this.options().pkg;

		const cacheDir = path.join(__dirname, "..", ".cache"),
			sourceDir = path.join(__dirname, "..", "source");
		grunt.file.exists(cacheDir) && grunt.file.delete(cacheDir, {force: true});
		grunt.file.exists(path.join(sourceDir, "FontMassive Pack"))	&& grunt.file.delete(path.join(sourceDir, "FontMassive Pack"), {force: true});
		!grunt.file.exists(cacheDir) && grunt.file.mkdir(cacheDir);
		const formatTime = function(value, len = 2){
				return String(Math.round((value / 360) % 24)).padStart(2, "0") + 
				 ":" + String(Math.round((value / 60) % 60)).padStart(2, "0") + 
				 ":" + String(Math.ceil(value % 60)).padStart(2, "0");
			},
			autopaddingVal = function (value, length, opt){
				return (opt.autopaddingChar + value).slice(-length);
			},
			formatBytes = function(bytes, decimals = 2) {
				if (bytes === 0) return '0 Bt';
				const k = 1024;
				const dm = decimals < 0 ? 0 : decimals;
				const sizes = ['Bt', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
				const i = Math.floor(Math.log(bytes) / Math.log(k));
				return parseFloat(bytes / Math.pow(k, i)).toFixed(dm) + ' ' + sizes[i];
			},
			formatBar = function(optionsBar, paramsBar, payloadBar){
				function autopadding(value, length){
					return (optionsBar.autopaddingChar + value).slice(-length);
				}
				const completeSize = Math.round(paramsBar.progress * optionsBar.barsize);
				const incompleteSize = optionsBar.barsize - completeSize;
				const bar = optionsBar.barCompleteString.substr(0, completeSize) +
						optionsBar.barGlue +
						optionsBar.barIncompleteString.substr(0, incompleteSize);
				const percentage =  Math.floor(paramsBar.progress * 100) + '';
				const stopTime = paramsBar.stopTime || Date.now();
				const elapsedTime = formatTime(Math.round((stopTime - paramsBar.startTime)/1000));
				const barStr = colorEnb ? _colors.white('|') + _colors.cyan(bar) + _colors.white('|')  + ' ' + _colors.yellowBright(autopadding(percentage, 3) + '%') + _colors.white(" | " + elapsedTime + "." + String((stopTime - paramsBar.startTime) % 1000).padStart(3, "0")) : '|' + bar  + '| ' + autopadding(percentage, 3) + "% | " + elapsedTime + "." + String((stopTime - paramsBar.startTime) % 1000).padStart(3, "0");
				return barStr;
			},
			rightpad = function(str, len, ch = false) {
				str = String(str);
				if (!ch && ch !== 0)
					ch = ' ';
				return str.padEnd(len, ch);
			};
		function FontMassive(url, output){
			return new Promise(function(resolve, reject){
				const progress = new cliProgress.SingleBar({
					stopOnComplete: true,
						hideCursor: false,
						autopadding: true,
						barsize: 50
					},{
						format: formatBar,
						barCompleteChar: '\u2588',
						barIncompleteChar: '\u2592'
					});
				const dl = new DownloaderHelper(url, cacheDir, {
					forceResume: true,
					override: true,
					httpsRequestOptions: {
						strictSSL: false
					},
					fileName: output
				});
				dl.on('response', function(res){
					//console.log('response');
				});
				dl.on('end', function() {
					progress.stop();
					//grunt.file.mkdir(path.join(cacheDir, "FontMassive Pack"));
					const unzip = new zl.Unzip();
					// out dir
					let outDir = ((output == 'LinearText.zip') || (output == 'Circular.zip')) ? path.join(sourceDir, "FontMassive Pack") : sourceDir;
					unzip.extract(path.join(cacheDir, output), outDir).then(function () {
							grunt.file.delete(path.join(cacheDir, output), {
								force: true
							});
							resolve("done");
						}, function (err) {
						if (err.name === "Canceled") {
							reject("cancel");
						} else {
							reject(err);
						}
					});
				});
				dl.on('error', function(err){
					progress.stop();
					grunt.log.errorlns('Download Failed', err);
					reject(err);
				});
				dl.on('progress', function(data){
					progress.update(parseInt(data.progress));
				});
				dl.start().catch(function(err) {
					progress.stop();
					reject(err);
				});
				progress.start(100, 0);
			});
		}
		function log(inputName) {
			grunt.log.writeln(" ");
			let simbol = '√';
			let dw = 'Download →';
			let out = colorEnb ? `${dw} ${_colors.yellowBright(simbol)} ${inputName}` : `${dw} ${simbol} ${inputName}`
			grunt.log.oklns([`${out}`]);
		}
		// FontMassive
		// https://fontmassive.com/download.php?prog=FontMassive
		// https://fontmassive.com/download.php?prog=FontMassive64
		log(`FontMassive`);
		FontMassive(`https://fontmassive.com/download.php?prog=FontMassive`, `FontMassive.zip`).then(function(){
			log(`FontMassive64`);
			FontMassive(`https://fontmassive.com/download.php?prog=FontMassive64`, `FontMassive64.zip`).then(function(){
				// FonTemp
				// https://fontmassive.com/download.php?prog=FonTemp
				// https://fontmassive.com/download.php?prog=FonTemp64
				log(`FonTemp`);
				FontMassive(`https://fontmassive.com/download.php?prog=FonTemp`, `FonTemp.zip`).then(function(){
					log(`FonTemp64`);
					FontMassive(`https://fontmassive.com/download.php?prog=FonTemp64`, `FonTemp64.zip`).then(function(){
						// FontDetect
						// https://fontmassive.com/download.php?prog=FontDetect
						// https://fontmassive.com/download.php?prog=FontDetect64
						log(`FontDetect`);
						FontMassive(`https://fontmassive.com/download.php?prog=FontDetect`, `FontDetect.zip`).then(function(){
							log(`FontDetect64`);
							FontMassive(`https://fontmassive.com/download.php?prog=FontDetect64`, `FontDetect64.zip`).then(function(){
								// FontQuickView
								// https://fontmassive.com/download.php?prog=FontQuickView
								// https://fontmassive.com/download.php?prog=FontQuickView64
								log(`FontQuickView`);
								FontMassive(`https://fontmassive.com/download.php?prog=FontQuickView`, `FontQuickView.zip`).then(function(){
									log(`FontQuickView64`);
									FontMassive(`https://fontmassive.com/download.php?prog=FontQuickView64`, `FontQuickView64.zip`).then(function(){
										// LinearText
										// https://fontmassive.com/download.php?prog=LinearText
										log(`LinearText`);
										FontMassive(`https://fontmassive.com/download.php?prog=LinearText`, `LinearText.zip`).then(function(){
											// LinearText
											// https://fontmassive.com/download.php?prog=Circular
											log(`Circular`);
											FontMassive(`https://fontmassive.com/download.php?prog=Circular`, `Circular.zip`).then(function(){
												done();
											}).catch(function(e){
												done(`${e}`);
											});
										}).catch(function(e){
											done(`${e}`);
										});
									}).catch(function(e){
										done(`${e}`);
									});
								}).catch(function(e){
									done(`${e}`);
								});
							}).catch(function(e){
								done(`${e}`);
							});
						}).catch(function(e){
							done(`${e}`);
						});
					}).catch(function(e){
						done(`${e}`);
					});
				}).catch(function(e){
					done(`${e}`);
				});
			}).catch(function(e){
				done(`${e}`);
			});
		}).catch(function(e){
			done(`${e}`);
		});
	});
}