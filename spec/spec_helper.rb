require 'bundler/setup'

Bundler.setup(:default, :development, :test)

require File.expand_path(File.dirname(__FILE__) + '/../lib/sequel/plugins/money')

RSpec.configure do |config|
  DB = Sequel.sqlite

  DB.create_table(:orders) do
    primary_key :id, auto_increment: true
    Fixnum :price_cents, null: false, default: 0
    String :currency, null: false
  end
end
