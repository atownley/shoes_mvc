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
# File:     array_table_model.rb
# Created:  Sat 19 Nov 2011 19:56:17 GMT
#
#####################################################################
#++ 

module ShoesMVC
module Models

  # This class implements the TableModel interface based on
  # the data being stored in an array.  The elements in the
  # array must either be a Hash, or they must respond to the
  # [] accessors for retrieving elements by key and implement
  # a #keys method for indicating the properties in each row
  # instance.

  class ArrayTableModel < TableModel
    def initialize(data)
      @data = data
    end

    def keys
      if @data && @data.size > 0
        @data.keys
      else
        {}
      end
    end

    def each(&block)
      @data.each(&block)
    end

    def each_with_index(&block)
      @data.each_with_index(&block)
    end
  end

end
end
