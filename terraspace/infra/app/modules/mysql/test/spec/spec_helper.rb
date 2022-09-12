ENV["TS_ENV"] = "test"

require "terraspace"
require "rspec/terraspace"

module Helper
  def execute(cmd)
    puts "Running: #{cmd}" if ENV['SHOW_COMMAND']
    out = `#{cmd}`
    puts out if ENV['SHOW_COMMAND']
    out
  end
end

RSpec.configure do |c|
  c.include Helper
  c.include RSpec::Terraspace::Helpers
end
