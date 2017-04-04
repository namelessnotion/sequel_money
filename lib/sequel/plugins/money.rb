require 'sequel'
require 'money'

module Sequel
  module Plugins
    module Money
      def self.configure(model, money_attr_name, options = {})
        subunit_column = :"#{money_attr_name}_cents"
        currency_column = :"#{money_attr_name}_currency"


        model.instance_eval do
          unless respond_to?(money_attr_name)
            define_method(money_attr_name) do
              amount = self[subunit_column]
              currency = self[currency_column]
              ::Money.new(amount || 0, currency)
            end
          end
        end

        model.instance_eval do
          define_method("#{money_attr_name}=") do |value|
            value = ::Money.new(value || 0, self.send(:[], currency_column)) unless value.is_a?(::Money)
            self[subunit_column] = value.cents
            self[currency_column] = value.currency.iso_code
          end
        end
      end
    end
  end
end
