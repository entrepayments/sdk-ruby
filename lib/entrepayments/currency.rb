class Currency
  BRL = 986

  def self.is_valid(currency)
    all_currencies.include?(currency)
  end

  def self.all_currencies
    [BRL]
  end
end