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
# File:     ar_model_editor.rb
# Created:  Sat 19 Nov 2011 11:26:37 GMT
#
#####################################################################
#++ 

module ShoesMVC
module Views

  # This class is responsible for building a form for the
  # given ActiveRecord model

  class ModelEditView < Shoes::Widget
    DEFAULTS    = {
                    :label_width => 0.3
                  }.freeze
    
    def initialize(model, options = {}, &block)
      super(options, &block)
      load(model, options, &block)
    end

    # This method is used to load the view with the
    # information in the AR model.

    def load(model, options = {}, &block)
      lwidth = options[:label_width] || DEFAULTS[:label_width]
      background red

      stack :width => "100%" do
        flow :width => "100%" do
          model.attributes.keys.sort.each do |key|
            value = model.attributes[key]
            flow :width => lwidth, :margin_top => 2 do
              para key, :weight => 'bold', :align => "right"
            end
            flow :width => 1 - lwidth do
              edit_line model.attributes[key] do |e|
                model.attributes[key] = e.text
              end
            end
          end
        end
      end
    end
  end

end
end