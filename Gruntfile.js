'use strict';

module.exports = function(grunt) {

  require('time-grunt')(grunt);

  grunt.initConfig({

    pkg: grunt.file.readJSON('package.json'),

    clean: {
      assets: [
        'dist/',
      ]
    },
    copy: {
      master: {
        files: [{
          expand: true,
          flatten: true,
          src: [
            'app/',
          ],
          dest: 'dist/'
        }]
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-copy');

  grunt.registerTask('build', [
    'copy:master',
  ]);
  grunt.registerTask('default', [
  
  ]);
};