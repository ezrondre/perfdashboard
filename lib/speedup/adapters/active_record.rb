require 'speedup/adapters/base'

module Speedup
  module Adapters
    class ActiveRecord < Base

      def get(request_id)
        request = ::Perfdashboard::Request.where(request_uid: request_id).first
      end

      def write(request_id, data)
        request = ::Perfdashboard::Request.create( (data[:request] || {}).merge({request_uid: request_id, server: ::Perfdashboard::Server.current}) )
        data.contexts.each do |context_type|
          next if context_type == :request
          context = ::Perfdashboard::Context.create( name: context_type, request_id: request.id )
          to_write = data[context_type].collect do |context_data|
            {context_id: context.id, duration: context_data.delete('duration'), time: context_data.delete('time'), data: context_data}
          end
          ::Perfdashboard::ContextInfo.transaction do
            ::Perfdashboard::ContextInfo.create(to_write)
          end
        end
        request
      end

    end
  end
end
