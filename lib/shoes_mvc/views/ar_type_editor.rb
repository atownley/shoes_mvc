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
# File:     ar_type_editor.rb
# Created:  Mon 21 Nov 2011 18:00:49 GMT
#
#####################################################################
#++ 

module ShoesMVC
module Views

  class ActiveRecordTypeEditor < View
    include ShoesMVC::LinkDispatcher

    def initialize(type, options = {}, &block)
      ctrl = options[:controller] = options[:controller] || self
      super(options, &block)
      @type = type
      @list = active_record_type_list type
      para link("New...") {
        ctrl.link_activated(self, "/create_instance")
      }
    end

    def create_instance(sender, link)
      debug("create instance of type #{@type}")
      obj = @type.new
      window do
        stack do
          obj.description = "Some text"
          editor = active_record_model_editor obj
          flow :margin_left => 0, :left => "-25%" do
            button "Cancel", :align => "right" do 
              close 
            end
            button "Save", :align => "right" do
              editor.save
              close
            end
            debug("created buttons")
          end
        end
      end
    end
  end

end
end
