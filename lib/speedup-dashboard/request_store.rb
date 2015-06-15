require 'speedup/request_data'

module SpeedupDashboard

  class RequestStore

    def self.establish_connection(adapter_options)
      adapter, *parameters = *Array.wrap(adapter_options).flatten

      @connection = case adapter
      when Symbol
        adapter_class_name = adapter.to_s.camelize
        adapter_class =
          begin
            require "speedup/adapters/#{adapter}"
          rescue LoadError => e
            raise "Could not find adapter for #{adapter} (#{e})"
          else
            ::Speedup::Adapters.const_get(adapter_class_name)
          end
        adapter_class.new(*parameters)
      when nil
        require 'speedup/adapters/memory'
        ::Speedup::Adapters::Memory.new
      else
        adapter
      end

      @connection
    end

    def self.connection
      @connection || establish_connection(Rails.configuration.speedup_dashboard.adapter)
    end

    def initialize(request_id)
      @request_id = request_id
    end

    def id
      @request_id
    end

    def load(contexts, data)
      @data = Speedup::RequestData.new.load(contexts, data)
    end

    def save
      self.class.connection.write(@request_id, @data)
    end

  end
end
