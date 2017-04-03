module.exports = function (grunt) {

    grunt.config.set('watch', {

        scripts: {
            files: [
                '!.grunt',
                '<%= paths.src_js %>/**/*.js',
                '<%= paths.src_css %>/less/**',
                '<%= paths.tests %>/**/*.js'
            ],
            tasks: ['newer:jshint', 'newer:browserify', 'newer:less', 'newer:concat', 'newer:copy', 'newer:imagemin', 'jasmine:ci'],
            options: {
                interrupt: true
            }
        }

    });

    grunt.loadNpmTasks('grunt-contrib-watch');

};
