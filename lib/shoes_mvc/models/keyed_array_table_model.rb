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
# File:     keyed_array_table_model.rb
# Created:  Sat 19 Nov 2011 18:58:36 GMT
#
#####################################################################
#++ 

module ShoesMVC
module Models

  class KeyedArrayTableModel < TableModel

    # This class provides a row adapter for each row in the
    # array so that it behaves effectively like a Hash
    # instance, but which still allows the underlying array to
    # be manipulated without problem.

    class Row
      # The instance is created with an array of strings or
      # symbols used to denote the keys of the model.  The keys
      # MUST be specified in the order of the data elements in
      # the data array.  When the model is asked for the value
      # for a given key, the value is retrieved from the data
      # array by the position of the key in the keys array.

      def initialize(keys, row)
        @keys = keys
        @row = row
      end

      def [](key)
        @row[@keys[key.to_sym]]
      end

      def []=(key, val)
        @row[@keys[key.to_sym]] = val
      end
    end

    # This method is used to initialize the mo
    def initialize(keys, data)
      @keys = {}
      keys.each_with_index { |x, i| @keys[x.to_sym] = i }
      @data = data
    end

    def keys
      @keys.keys
    end

    def each(&block)
      @data.each do |x|
        block.call(Row.new(@keys, x))
      end
    end

    def each_with_index(&block)
      @data.each_with_index do |x, i|
        block.call(Row.new(@keys, x), i)
      end
    end
  end

end
end
