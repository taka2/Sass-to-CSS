require 'rubygems'
require 'rack'
require 'sass2css'

map "/convert" do
  run Sass2CssApp.new
end
