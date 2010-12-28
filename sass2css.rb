require 'rubygems'
require 'sass'

class Sass2CssApp
  def call(env)
    req = Rack::Request.new(env)

    # Initialize Sass Engine
    begin
      sass_engine = Sass::Engine.new(req.params["src"], {
        :syntax => req.params["syntax"].intern, 
        :style => req.params["style"].intern
      })

      # Convert to CSS
      begin
        result = sass_engine.render
        [200, {"Content-Type" => "text/plain"}, [result]]
      rescue
        [200, {"Content-Type" => "text/plain"}, ["Syntax error."]]
      end
    rescue
      [200, {"Content-Type" => "text/plain"}, ["Unable to initialize Sass:Engine."]]
    end
  end
end
