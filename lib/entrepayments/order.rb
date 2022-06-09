class Order
  attr_accessor :amount,
                :description,
                :number

  def currency
    @currency
  end

  def currency=(currency)
    unless Currency.is_valid(currency)
      raise "Currency #{currency} is not valid"
    end

    @currency = currency
  end

  def initialize(number, amount, currency = Currency::BRL, description = "")
    @number = number
    @amount = amount
    @currency = currency
    @description = description
  end
end