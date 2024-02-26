const path = require("path");

var YoutubeMp3Downloader = require("youtube-mp3-downloader");

//Configure YoutubeMp3Downloader with your settings
var YD = new YoutubeMp3Downloader({
    "ffmpegPath": path.join(process.cwd(), 'ffmpeg'),        // FFmpeg binary location
    "outputPath": path.join(process.cwd(),),    // Output file location (default: the home directory)
    "youtubeVideoQuality": "highestaudio",  // Desired video quality (default: highestaudio)
    "queueParallelism": 2,                  // Download parallelism (default: 1)
    "progressTimeout": 2000,                // Interval in ms for the progress reports (default: 1000)
    "allowWebm": false                      // Enable download from WebM sources (default: false)
});

//Download video and save as MP3 file
YD.download("pwAVCWt494M");

YD.on("finished", function (err, data) {
    console.log(JSON.stringify(data));
});

YD.on("error", function (error) {
    console.log(error);
});

YD.on("progress", function (progress) {
    console.log(JSON.stringify(progress));
});
