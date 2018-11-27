$stdout.sync = true
require './app'
run Rack::Cascade.new [LiquidSwords]
