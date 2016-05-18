# Sequel Money Gem
Ruby: 2.3
Sequel: https://github.com/jeremyevans/sequel 4.34.0
Money: https://github.com/RubyMoney/money 6.7.1

# Install

```
gem 'sequel_money', git: "https://github.com/namelessnotion/sequel_money", branch: 'master'
```

# Use

```
class Transaction < Sequel::Model
  plugin :money, :amount
end

transaction = Transaction.new
transaction.amount #<Money fractional:0 currency:USD>
transaction.amount = 1000
transaction.amount_cents #<Fixnum:1000>
trsnsaction.amount #<Money fractional:1000 currency:USD>
```
