module SMQ
  class Broker < EventMachine::Connection
    include SMQ::Logger
    
    ##############################
    ### EventMachine Callbacks ###
    ##############################
    
    def post_init
      logger.debug "new connection #{@signature}"
      # respond(:status => :ok, :signature => @signature)
    end
    
    def receive_data payload
      if data = request(payload)
        respond ">>>you sent: #{data}"
        close_connection if data =~ /quit/i
      end
    end
    
    def unbind
      logger.debug "connection #{@signature} closed"
    end
    
    ###############
    ### Helpers ###
    ###############
    
    def request(payload)
      puts payload.inspect
      Marshal.load(payload)
    rescue Exception => e
      logger.error "ERROR: %s" % e.message
      logger.debug "\t" + e.backtrace.join("\t\n")
    end
    
    def respond(data)
      puts data.inspect
      send_data Marshal.dump(data)
    rescue Exception => e
      logger.error "ERROR: %s" % e.message
      logger.debug "\t" + e.backtrace.join("\t\n")
    end
    
  end
end
