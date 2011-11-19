#--
######################################################################
#
# Copyright 2011 Andrew S. Townley
#
# Permission to use, copy, modify, and disribute this software for
# any purpose with or without fee is hereby granted, provided that
# the above copyright notices and this permission notice appear in
# all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHORS DISCLAIM ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS.  IN NO EVENT SHALL THE
# AUTHORS BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT OR
# CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
# NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
# CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
# File:     app_controller.rb
# Created:  Sat 19 Nov 2011 11:29:49 GMT
#
#####################################################################
#++ 

module ShoesMVC

  # This controller is used to assist in writing Shoes
  # applications for an existing Rails application.  All of
  # the models will be automatically loaded based on the
  # directory configuration of the Rails environment, and the
  # database connection environment will be used.

  class AppController
    # The controller is instantiated by an
    # application-specific controller instance that passes
    # through the location of the appication controller source
    # file.
    #
    # By convention, the application is configured using an
    # app.yml file in the same directory as the application
    # controller.

    def initialize(app, app_file)
      @shoes = app
      @config_file = File.expand_path(File.join(File.dirname(app_file), "../app.yml"))
      if !File.exist? @config_file
        @shoes.alert("Unable to locate configuration file.\nFile '#{@config_file}' not found.")
        @shoes.exit
      end

      @config = YAML.load(File.new(@config_file))
      setup
      run
    end

    # This method is a placeholder for the actual
    # initialization to be performed by the Shoes application
    # itself.  It is called automatically by the constructor
    # of the application controller.

    def run
    end

  protected
    def config
      @config || {}
    end

    # This method is called prior to calling the #run method
    # to give the derived controller classes an opportunity to
    # perform any specific initialization.

    def setup
    end
  end

end
