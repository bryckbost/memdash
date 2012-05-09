# Memdash [![Build Status](https://secure.travis-ci.org/bryckbost/memdash.png)](http://travis-ci.org/bryckbost/memdash) [![Dependency Status](https://gemnasium.com/bryckbost/memdash.png)](https://gemnasium.com/bryckbost/memdash)

A dashboard for your memcache, making use of your applications backend to store historical data.

![Screenshot of memdash](https://github.com/bryckbost/memdash/raw/front-end/screenshot.png)

## Installation and Usage with the Supported ORMs

Memdash supports the following backends:

* ActiveRecord
* MongoMapper
* Mongoid

### ActiveRecord

To begin using Memdash, add the gem to your Gemfile and run `bundle`:

    gem 'memdash-activerecord'

Once that's been done, run the generator and migration with:

    $ rails g memdash:active_record
    $ rake db:migrate

The generator will create a table (`memdash_reports`) to store a serialized column of statistics from your cache servers.

### MongoMapper

All you need to do is add the gem to your Gemfile and run `bundle`:

    gem 'memdash-mongo_mapper'

### Mongoid

Add the gem to your Gemfile and run `bundle`:

    gem 'memdash-mongoid'

From this point onward, any calls to the cache should generate statistics and shove them into that table. But don't worry, Memdash won't actually write to the database on every call. Instead, it caches the stats within memcache for a minute and writes when it needs to.

To view the dashboard, you'll need to add `require 'memdash/server'` to `config/routes.rb` and mount a server at an endpoint. It might look something like this:

    require 'memdash/server'

    MyRailsApp::Application.routes.draw do
      …other routes…

      mount Memdash::Server.new, :at => "/memdash"
    end

## What's the point?

Memdash is meant to give you insight into your memcached setup without adding overhead to your application or relying on a background process.

I find it useful when deploying apps to Heroku, where the memcached add-on is a bit of a black box. Stuff goes in, stuff comes out. Hopefully, it's being used effectively. Memdash could fill the gap between not having any statistics and having to send custom data to Scout, New Relic or statsd.

## How Does it Work?

Building on top of [Dalli](https://github.com/mperham/dalli), Memdash hooks into Dalli's chokepoint method to generate statistics.

When a call to the cache is triggered, `memdash` performs that operation and does a `get` for the key `memdash`. If the returned value is not found, Memdash then writes the cache statistics to the database and `add`s the `memdash` key with a default time to live of 60 seconds.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
