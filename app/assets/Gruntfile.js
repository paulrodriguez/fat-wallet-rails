module.exports = function (grunt) {

    // output task timing
    require('time-grunt')(grunt);

    // Project config
    grunt.initConfig({

        // read grunt tasks from npm
        pkg: grunt.file.readJSON('package.json'),

        // configure paths for grunt plugins
        paths: {
            
            assets: '../../vendor/assets',
            tests: 'tests',

            src_js: 'javascripts',
            src_css: 'stylesheets',
            src_img: 'images',
            src_font: 'fonts',
            src_json: 'json',
            src_tmp: 'tmp',

            dist_js: '../../public/javascripts',
            dist_css: '../../public/stylesheets',
            dist_img: '../../public/images',
            dist_font: '../../public/fonts',
            dist_json: '../../public/json'
        }

    });

    // load grunt plugins from directory
    grunt.loadTasks('grunt_tasks');

    grunt.registerTask('prep',
        'Prepare project assets',
        ['clean:nuke', 'bower', 'jshint', 'browserify', 'less', 'concat', 'copy', 'newer:imagemin', 'jasmine:ci']
    );

    grunt.registerTask('dev',
        'Prepare project assets',
        ['prep', 'watch']
    );

    grunt.registerTask('prod',
        'Prepare project assets',
        ['prep', 'cssmin', 'uglify', 'clean:prod']
    );

    grunt.registerTask('default', ['prep', 'dev', 'prod']);

};
