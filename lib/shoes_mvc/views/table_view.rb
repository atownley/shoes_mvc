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
# File:     table_view.rb
# Created:  Sat 19 Nov 2011 20:14:33 GMT
#
#####################################################################
#++ 

module ShoesMVC
module Views

  # This class provides a basic TableView control based
  # loosely on the Archistry JavaScript TreeGrid API.  It
  # requires that the data to be displayed be supplied as a
  # TableModel instance.

  class TableView < Shoes::Widget
    def initialize(model, options = {}, &block)
      super(options, &block)
      load(model, options, &block)
    end

    # This method is used to load the view with the
    # information in the table model.

    def load(model, options = {}, &block)
      cols = columns(model, options)
      defw = "#{100 / cols.size}%"
      build_header(model, cols, defw, options)
      stack(:width => "100%") do
        model.each { |row| build_row(cols, row, defw) }
      end
    end

  protected
    # This method extracts or creates the column model for the
    # view.

    def columns(model, options)
      if cols = options[:columns]
        cols
      else
        cols = model.keys.collect do |k|
          { :key => k.to_sym, :label => "#{k.capitalize}" }
        end
      end
    end

    def build_header(model, cols, defw, options)
      if options[:headers] != false
        stack(:width => "100%") do
          flow do
            cols.each do |col|
              flow(:width => defw) do
                para col[:label], :weight => "bold", :align => "center"
              end
            end
          end
        end
      end
    end

    def build_row(cols, row, defw)
      flow do
        cols.each do |col|
          flow(:width => defw) do
            para row[col[:key]], col[:style]
          end
        end
      end
    end
  end

end
end
