$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'warden_oauth'
require 'spec'
require 'fakeweb'
require 'spec/autorun'

require File.dirname(__FILE__) + "/application_scenario"

Spec::Runner.configure do |config|
  config.before(:all) do
    FakeWeb.allow_net_connect = false
  end
end
