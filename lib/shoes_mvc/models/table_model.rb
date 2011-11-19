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
# File:     table_model.rb
# Created:  Sat 19 Nov 2011 18:13:40 GMT
#
#####################################################################
#++ 

module ShoesMVC
module Models

  # This class defines the behavior of a base TableModel API
  # that is used by the TableView class.  The model represents
  # an ordered set of data rows which are "square" in that
  # they are expected to all have the same number of columns.
  #
  # Logically, each of the elements in the table model is a
  # row instance that provides keyed property access to the
  # data in the model based on the [] method.

  class TableModel
  end

end
end
