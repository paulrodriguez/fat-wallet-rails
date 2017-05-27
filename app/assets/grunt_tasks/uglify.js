module.exports = function(grunt) {

    grunt.config.set('uglify', {
      libraries: {
          files: {
            '<%= paths.dist_js %>/bundle.js':['<%= paths.src_js%>/dependencies.js']
          },
        }
    });

};
