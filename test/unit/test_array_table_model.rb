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
# File:     test_shoes_mvc.rb
# Created:  Mon 21 Nov 2011 18:10:45 GMT
#
######################################################################
#++

require 'testy'
require 'shoes_mvc/module'

Testy.testing "Core module tests" do
  test "Basic functionality" do |result|
    data = %w( some_path some_path module_klass )
    %w( /some_path /somePath Module::Klass ).each_with_index do |uri, i|
      result.check "uri to method_name #{uri}",
          :expect => data[i],
          :actual => ShoesMVC.method_name(uri)
    end
  end
end
