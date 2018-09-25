require 'rubygems'
require 'spork'
require 'rspec'

Dir[File.join(File.dirname(__FILE__), "..", "lib", "**/*.rb")].each do |f|
  require f
end

Spork.prepork do

end

Spork.each_run do

end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = treat_symbols_as_metadata_keys_with_true_value = true
  config.filter_run :focus

  config.order = 'ramdom'
end

#src以下のファイルを読み込むよう最後に以下を追記
Dir.glob(File.join(File.dirname(__FILE__), "../src/**/*.rb")).each { |f| require f }
