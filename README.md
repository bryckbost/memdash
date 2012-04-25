# Memdash [![Build Status](https://secure.travis-ci.org/bryckbost/memdash.png)](http://travis-ci.org/bryckbost/memdash) [![Dependency Status](https://gemnasium.com/bryckbost/memdash.png)](https://gemnasium.com/bryckbost/memdash)

A dashboard for your memcache. **This is a work in progress,** but aims to provide a little insight into your application's memcached servers.

![Screenshot of memdash](https://github.com/bryckbost/memdash/raw/front-end/screenshot.png)

## Installation

Add this line to your application's Gemfile:

    gem 'memdash'

And then from the console, run:

    $ bundle

Or install it yourself as:

    $ gem install memdash

## Usage

To begin using Memdash, run the following:

    $ rails g memdash:active_record
    $ rake db:migrate

The generator will create a table (`memdash_reports`) to store a serialized column of statistics from your cache servers.

From this point onward, any calls to the cache should generate statistics and shove them into that table. But don't worry, Memdash won't actually write to the database on every call. Instead, it caches the stats within memcache for a minute and writes when it needs to.

To view the dashboard, you'll need to add `require 'memdash/server'` to `config/routes.rb` and mount a server at an endpoint. It might look something like this:

    require 'memdash/server'

    MyRailsApp::Application.routes.draw do
      …other routes…

      mount Memdash::Server.new, :at => "/memdash"
    end

## Why Did I Build This?

Memdash is meant to give you insight into your memcached setup without adding overhead to your application. I found it useful when deploying apps to Heroku where the memcached add-on is a bit of a black box. Stuff goes in, stuff comes out. Hopefully, it's being used effectively.

## How Does it Work???

Building on top of [Dalli](https://github.com/mperham/dalli), Memdash hooks into Dalli's chokepoint method to generate statistics.

When a call to the cache is triggered, `memdash` performs that operation and does a `get` for the key `memdash`. If the returned value is not found, Memdash then writes the cache statistics to the database and `add`s the `memdash` key with a default time to live of 60 seconds.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
