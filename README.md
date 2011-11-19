
README for Shoes MVC
====================

This project provides a basic MVC framework on top of the Shoes
environment for those of us strange people who have done MVC so long
it's extremely difficult to think about applications other ways.

Installation
============

At the moment, you have to build the gem from source and then install
into the local Shoes gem dir.  I'm hoping to get this published on
rubygems.org as soon as I have something that kinda works.

    $ gem build shoes_mvc.gemspec
    $ gem install --install-dir $HOME/.shoes/+gem ./*.gem
