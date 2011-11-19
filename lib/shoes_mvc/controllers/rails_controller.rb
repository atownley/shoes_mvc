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
# File:     rails_controller.rb
# Created:  Sat 19 Nov 2011 11:29:49 GMT
#
#####################################################################
#++ 

require 'active_record'

module ShoesMVC

  # This controller is used to assist in writing Shoes
  # applications for an existing Rails application.  All of
  # the models will be automatically loaded based on the
  # directory configuration of the Rails environment, and the
  # database connection environment will be used.
  #
  # This controller uses the following configuration settings
  # to help it initialize itself:
  #
  # rails_app - the location of the app directory of the Rails
  #             application
  #
  # config    - the default database configuration to use by
  #             the application

  class RailsController < AppController
    def setup
      @rails_app = File.expand_path(File.join(
            File.dirname(@config_file), config["rails_app"]))
      connect_db
      load_models
    end

  private
    def connect_db
      yml = File.expand_path(File.join(@rails_app, "../config/database.yml"))
      dbconf = YAML.load(File.new(yml))
      env = dbconf[config["config"]]

      case(env["adapter"])
      when "sqlite3"
        env["database"] = File.join("#{@rails_app}/..", env["database"])
      end
      ActiveRecord::Base.establish_connection(env)
    end

    def load_models
      Dir.glob(File.join(@rails_app, "models/*.rb")) { |m| require m }
    end
  end

end
