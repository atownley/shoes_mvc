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
# File:     views.rb
# Created:  Sat 19 Nov 2011 11:28:08 GMT
#
#####################################################################
#++ 

module ShoesMVC
  module Views
    
    # This is the base view class that provides integration
    # with the controllers

    class View < Shoes::Widget
      attr_accessor :controller

      def initialize(*args)
        if(options = args.last).is_a? Hash
          self.controller = options[:controller]
        end
      end
    end
  end
end

require 'shoes_mvc/views/table_view'
require 'shoes_mvc/views/ar_model_editor'
require 'shoes_mvc/views/ar_type_list'
require 'shoes_mvc/views/ar_type_editor'
