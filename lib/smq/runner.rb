module SMQ
  class Runner
    include SMQ::Logger
    
    def self.run!(args)
      EventMachine::run do
        EventMachine.start_server(SMQ.options[:server], SMQ.options[:port], Broker)
        logger.info "Now accepting connections at %s:%i..." % [SMQ.options[:server], SMQ.options[:port]]
      end
    end
    
  end
end
