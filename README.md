# Sequel Money Gem

Sequel: https://github.com/jeremyevans/sequel

Money: https://github.com/RubyMoney/money

# Install

gem 'sequel_money', git: "https://github.com/namelessnotion/sequel_money", branch: 'master'

# Use

```
class Transaction < Sequel::Model
  plugin :money
  
  monetize :amount
  monetize :fee
end

transaction = Transaction.new
transaction.amount 
```
