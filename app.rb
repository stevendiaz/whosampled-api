# Requires the Gemfile
require 'bundler' ; Bundler.require
require 'nokogiri'

# By default Sinatra will return the string as the response.
get '/' do
  "Hello World!"
end

get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
    return say_hello(params['name'])
end

def say_hello(name)
    return "Hello, " + name + "!\n"
end

