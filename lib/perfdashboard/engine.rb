require 'bootstrap-sass'
require 'bootstrap_form'
require 'groupdate'
require 'chartkick'

module Perfdashboard
  class Engine < ::Rails::Engine
    isolate_namespace Perfdashboard

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    config.perfdashboard = ActiveSupport::OrderedOptions.new

    config.perfdashboard.adapter = :active_record

    initializer "perfdashboard.assets.precompile" do |app|
      # app.config.assets.precompile += %w(admin.css admin.js)
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths['db/migrate'].expanded.each do |expanded_path|
          app.config.paths['db/migrate'] << expanded_path
        end
      end
    end
  end
end
