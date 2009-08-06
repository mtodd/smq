$:.unshift File.dirname(__FILE__)

require 'eventmachine'

require 'smq/version'
require 'smq/logger'
require 'smq/runner'
require 'smq/broker'
require 'smq/router'

module SMQ
  class << self
    attr_accessor :options
  end
  @options = {
    :server => "127.0.0.1",
    :port => 9876,
    :log_level => 'debug'
  }
end
