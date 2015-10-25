# Things you need to do for a Sinatra app

```
require 'sinatra'
require 'sinatra/'
```

```


CREATE TABLE blog (
    id INTEGER PRIMARY KEY,
    title TEXT,
    date_written VARCHAR, --change this to a different thing later
    author TEXT,
    entry TEXT,
    picture VARCHAR
);
```

```
sqlite3 database.db < setup.sql
```

```
gem 'sinatra-advanced-routes'

require 'sinatra-advanced-routes' (https://github.com/rkh/sinatra-advanced-routes#readme)
```

Sinatra advanced routes

```
SomeSinatraApp.each_route do |route|
  puts "-" * 20
  puts route.app.name   # "SomeSinatraApp"
  puts route.path       # that's the path given as argument to get and akin
  puts route.verb       # get / head / post / put / delete
  puts route.file       # "some_sinatra_app.rb" or something
  puts route.line       # the line number of the get/post/... statement
  puts route.pattern    # that's the pattern internally used by sinatra
  puts route.keys       # keys given when route was defined
  puts route.conditions # conditions given when route was defined
  puts route.block      # the route's closure
end
```
