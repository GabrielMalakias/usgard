require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/usgard'
require_relative '../apps/web/application'

require_relative './initializers/auto_inject'

Sequel.split_symbols = true

Hanami.configure do
  mount Web::Application, at: '/'

  model do
   adapter :sql, ENV['DATABASE_URL']

   migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/usgard/mailers'

    delivery do
      development :test
      test        :test
    end
  end

  environment :development do
    logger level: :info
  end

  environment :production do
    logger level: :info, formatter: :json

    mailer do
      delivery :smtp, address: ENV['SMTP_HOST'], port: ENV['SMTP_PORT']
    end
  end
end
