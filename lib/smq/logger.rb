require 'logger'

module SMQ
  
  def self.logger
    @_logger ||= begin
      logger = SMQ.options[:logger] || ::Logger.new(SMQ.options[:log_file] || STDOUT)
      logger.formatter = proc{|s,t,p,m|"%5s [%s] (%s) %s :: %s\n" % [s, t.strftime("%Y-%m-%d %H:%M:%S"), $$, p, m]}
      logger.progname = "SMQ"
      logger.level = ::Logger.const_get((SMQ.options[:log_level] || 'info').upcase)
      logger
    end
  end
  
  module Logger
    
    def self.included(target)
      target.extend(ClassMethods)
    end
    
    def logger
      SMQ.logger
    end
    
    module ClassMethods
      def logger
        SMQ.logger
      end
    end
    
  end
end
