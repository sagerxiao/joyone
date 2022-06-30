var gulp = require('gulp'),
    $ = require('gulp-load-plugins')(),
    svn = require("node-svn-ultimate"),
    config = require("./config.json");

/**
 * 清除dist目录
 */
gulp.task('clean', function () {
    return gulp.src(["dist", "tmp", "build"], {read: false})
        .pipe($.clean({force: true}));
});

/**
 * Copy resources
 */
gulp.task('resource:copy', function () {
    return gulp.src(["app/**", "public/**", "precompile/**", "db/**", "lib/**", "conf/**", "modules/**", "*.sh"], {base: "./"})
        .pipe(gulp.dest("build/insurance-gateway"))
});

/**
 * 获取svn版本信息
 */
gulp.task("svn-info", function () {
    return svn.commands.info(".", [], function (err, info) {
        config.revision = info.entry.$.revision;
        console.log("svn.info.revision", info.entry.$.revision);
        $.file("config.json", JSON.stringify(config))
            .pipe(gulp.dest("./build/insurance-gateway"));
    });
});

/**
 * Versioning assets
 */

gulp.task("build", ["svn-info", "resource:copy"], function () {
    return $.run("play precompile", {cwd: "./build/insurance-gateway"}).exec();
});


/**
 * Generate deployment package
 */
gulp.task("dist", ["build"], function () {
    return gulp.src("./build/**/*")
        .pipe($.ignore.exclude(["**/insurance-gateway/app/**", "**/modules/**/app/**"]))
        .pipe($.tar("insurance-gateway-" + config.version + "." + config.revision + ".tar"))
        .pipe($.gzip())
        .pipe(gulp.dest("dist"));
});