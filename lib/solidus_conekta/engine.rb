module SolidusConekta
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'solidus_conekta'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end
    
    initializer "spree.gateway.payment_methods", after: "spree.register.payment_methods" do |app|
      app.config.spree.payment_methods << Spree::BillingIntegration::ConektaGateway
      app.config.spree.payment_methods << Spree::BillingIntegration::ConektaGateway::Cash
      app.config.spree.payment_methods << Spree::BillingIntegration::ConektaGateway::Card
      app.config.spree.payment_methods << Spree::BillingIntegration::ConektaGateway::Bank
      app.config.spree.payment_methods << Spree::BillingIntegration::ConektaGateway::MonthlyPayment
    end

    initializer 'solidus_conekta.assets.precompile' do |app|
      app.config.assets.precompile += %w( spree/backend/print.css )
    end
    
    config.to_prepare(&method(:activate).to_proc)
  end
end
