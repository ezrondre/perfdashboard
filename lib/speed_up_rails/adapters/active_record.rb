require 'speed_up_rails/adapters/base'

module SpeedUpRails
  module Adapters
    class ActiveRecord < Base

      def get(request_id)
        request = ::Perfdashboard::Request.where(request_id: request_id).first
      end

      def write(request_id, data)
        request = ::Perfdashboard::Request.create( (data[:request] || {}).merge({request_uid: request_id}) )
        data.contexts.each do |context_type|
          next if context_type == :request
          context = ::Perfdashboard::Context.create( name: context_type, request: request )
          data[context_type].each do |context_data|
            ::Perfdashboard::ContextInfo.create(context: context, duration: context_data.delete(:duration), data: context_data)
          end
        end
      end

    end
  end
end
