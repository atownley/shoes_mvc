
README for Shoes MVC
====================

This project provides a basic MVC framework on top of the Shoes
environment for those of us strange people who have done MVC so long
it's extremely difficult to think about applications other ways.

Installation
============

The normal way to ensure this gem is installed is to add it to the
Shoes.setup block, e.g.

	Shoes.setup do
		gem 'shoes_mvc'
	end

As of version 0.0.0, it's available as a gem from rubygems.org, so
this should just work.  If you're using the Rails integration, you'll
also need to have a version of ActiveRecord installed.

If you're building it manually (because you're hacking on it), then
you'll need to install it yourself in the local Shoes gem directory
for your user.  On MacOS X, you can do it like this:

    $ gem build shoes_mvc.gemspec
    $ gem install --install-dir $HOME/.shoes/+gem ./*.gem

Known Issues
============

The following issues are related to getting this gem actually
installed and working as expected:

	* http://librelist.com/browser/shoes/2011/11/18/a-tangled-web-mess-of-dependencies-encoding-vs-sqlite3-vs-activerecord/
	* https://github.com/shoes/shoes/issues/163
	* https://github.com/shoes/shoes/issues/164
