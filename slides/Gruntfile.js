/* global module:false */
module.exports = function(grunt) {
    var port = grunt.option('port') || 8000;

    grunt.initConfig({
        connect: {
            server: {
                options: {
                    port: port,
                    base: '.',
                    livereload: true,
                    open: true
                }
            }
        },
        watch: {
            options: {
                livereload: true
            },
            html: {
                files: [ 'index.html']
            }
        }
    });

    grunt.loadNpmTasks( 'grunt-contrib-watch' );
    grunt.loadNpmTasks( 'grunt-contrib-connect' );

    // Default task
    grunt.registerTask( 'default', [ 'serve' ] );

    // Serve presentation locally
    grunt.registerTask( 'serve', [ 'connect', 'watch' ] );
};
