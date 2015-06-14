'use strict';

module.exports = function(grunt) {

  require('time-grunt')(grunt);

  grunt.initConfig({

    pkg: grunt.file.readJSON('package.json'),

    clean: {
      dist: [
        'dist/',
      ]
    },
    copy: {
      master: {
        files: [{
          expand: true,
          flatten: false,
          cwd: 'app',
          src: [
            '**/*',
          ],
          dest: 'dist/'
        }]
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-clean');

  grunt.registerTask('build', [
    'clean:dist',
    'copy:master'
  ]);
  grunt.registerTask('default', [
  
  ]);
};