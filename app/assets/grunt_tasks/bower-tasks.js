module.exports = function(grunt) {

    grunt.config.set('bower', {

        install: {
            options: {
                targetDir: '<%= paths.assets %>',
                install: true,
                cleanTargetDir: true,  // clean the targetDir
                cleanBowerDir: true,  // clean the bower_components dir
                cleanup: true,  // set cleanBowerDir & cleanTargetDir
                copy: true,  // copy bower_components packages to targetDir
                layout: 'byType',  // format tree by component => js/css/less/img
                verbose: false,
                bowerOptions: {
                    forceLatest: false,  // Force latest version on conflict
                    production: false  // Do not install project devDependencies
                }
            }
        }

    });

    grunt.loadNpmTasks('grunt-bower-task');

};
