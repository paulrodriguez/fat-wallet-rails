module.exports = function(grunt) {

    grunt.config.set('browserify', {
      libraries: {
          files: {
            '<%= paths.dist_js %>/libraries.js':['<%= paths.src_js%>/libraries.js']
          },
        },
        test: {
          options: {
           transform: [['babelify', {presets: ['es2015', 'react']}]]
         },
          files: {
            '<%= paths.dist_js %>/react/test.js':
              ['<%= paths.src_js%>/react/react.jsx']
          }
        }
    });

};
