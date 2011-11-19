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
# File:     test_array_table_model.rb
# Created:  Sat 19 Nov 2011 20:00:25 GMT
#
######################################################################
#++

require 'testy'
require 'shoes_mvc/models'

include ShoesMVC::Models

Testy.testing "Core ArrayTableModel tests" do
  test "Basic functionality" do |result|
    keys = [ :foo, :bar ]
    data = [
      { :foo => "Foo1", :bar => "Bar1" }, 
      { :foo => "Foo2", :bar => "Bar2" } ]
    
    model = ArrayTableModel.new(data)
    model.each_with_index do |row, i|
      keys.each do |key|
        result.check "row[#{i}][:#{key}] value is correct",
            :expect => data[i][key],
            :actual => row[key]
      end
    end

    data << { :foo => "Foo3", :bar => "Bar3" }
    model.each_with_index do |row, i|
      keys.each do |key|
        result.check "row[#{i}][:#{key}] value is correct after add",
            :expect => data[i][key],
            :actual => row[key]
      end
    end
  end
end
