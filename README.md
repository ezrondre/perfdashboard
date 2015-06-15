# Speedup Dashboard
[![Gem Version](https://badge.fury.io/rb/speedup-dashboard.svg)](http://badge.fury.io/rb/speedup-dashboard)
[![Build Status](https://travis-ci.org/ezrondre/speedup-dashboard.png?branch=master)](https://travis-ci.org/ezrondre/speedup-dashboard)

## Overview

This gem is an frontend for [SpeedupRails][speeduprails] analyzer.
Implements an storage for its server adapter.
Stores requests informations for monitoring a Rails application over time.

It provides basic visualizations and analysis for this collected data.

[speeduprails]: https://github.com/ezrondre/speedup-rails

## Install

Dashboard is meant to be an standalone application.
It is implemented as an engine however, so it could be used in monitored application itself.
Use this in small applications and in development environment only.

The easiest way to install speedup-dashboard is by using Ruby Gems.
If you creating new app for it, follow Rails start guide first.

To install put in your Gemfile:
```ruby
gem 'speedup-dashboard'
```
And to your config/routes.rb file:
```ruby
mount SpeedupDashboard::Engine => 'speedup_dashboard'
```

You can even mount it to the '/' if you use it for only this purpouse.

Next migrate, go to the application and in the Servers section register your applications.
Than copy the api_keys to your prefered secrets storage and use it in configuration of speedup-rails gem in your monitored app ( you have to use server adapter ).

### Supported databases
Currently the gem is tested aginst PostgreSQL and MySQL.
It certainly won't run on SQLite since it uses a groupdate gem, wich requires advanced date techniques from sql.

## License

See MIT-LICENSE for license information.

## Development

Code is located at https://github.com/ezrondre/speedup-dashboard

Any contribution, or feedback will be appreciated.

