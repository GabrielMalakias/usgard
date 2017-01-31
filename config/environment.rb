require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/spacewing'
require_relative '../apps/web/application'

Hanami.configure do
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/spacewing_development.sqlite3'
    #    adapter :sql, 'postgres://localhost/spacewing_development'
    #    adapter :sql, 'mysql://localhost/spacewing_development'
    #
    adapter :sql, ENV['DATABASE_URL']

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/spacewing/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery do
      development :test
      test        :test
      # production :smtp, address: ENV['SMTP_PORT'], port: 1025
    end
  end
end
