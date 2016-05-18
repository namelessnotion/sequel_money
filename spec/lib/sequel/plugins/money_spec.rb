require 'spec_helper.rb'

class Order < Sequel::Model
  plugin :money, :price
end

describe Sequel::Plugins::Money do
  it 'returns a 0 amount money object' do
    order = Order.new
    expect(order.price).to eq(Money.new(0))
  end

  it 'it sets the cents and currency from fixnum' do
    order = Order.new
    order.price = 1000
    expect(order.price_cents).to eq(1000)
  end

  it 'it set the cents and currency from money' do
    order = Order.new
    order.price = Money.new(1000)
    expect(order.price_cents).to eq(1000)
  end
end
