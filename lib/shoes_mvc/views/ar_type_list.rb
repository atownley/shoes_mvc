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
# File:     ar_type_list.rb
# Created:  Mon 21 Nov 2011 15:57:27 GMT
#
#####################################################################
#++ 

module ShoesMVC
module Views

  class ActiveRecordTypeList < TableView
    def load(model, options = {}, &block)
      @entity_type = model
      super(model.find(options[:query] || :all), options, &block)
    end

    def columns(model, options)
      cols = []
      @entity_type.attribute_names.each do |key|
        cols << { :key => key, :label => key.capitalize }
      end
      cols
    end
  end

end
end
