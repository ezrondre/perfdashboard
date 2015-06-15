module SpeedupDashboard
  class Server < ActiveRecord::Base

    before_create :set_defaults

    has_many :requests

    def self.current=(server)
      Thread.current[:server] = server
    end

    def self.current
      Thread.current[:server]
    end

    private

      def set_defaults
        self.api_key = SecureRandom.hex
      end

  end
end
