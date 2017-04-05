require 'spec_helper.rb'

class Order < Sequel::Model
  plugin :money, :price
end

describe Sequel::Plugins::Money do
  it 'returns a 0 amount money object' do
    order = Order.new
    expect(order.price).to eq(Money.new(0))
  end

  it 'sets the cents and currency from fixnum' do
    order = Order.new
    order.price = 1000
    expect(order.price_cents).to eq(1000)
  end

  it 'set the cents and currency from money' do
    order = Order.new
    order.price = Money.new(1000)
    expect(order.price_cents).to eq(1000)
  end

  it 'sets the cents to nil' do
    order = Order.new
    order.price = 'notanumber'
    expect(order.price_cents).to be_nil
  end

  it 'sets the cents to nil' do
    order = Order.new
    order.price = nil
    expect(order.price_cents).to be_nil
  end
end
