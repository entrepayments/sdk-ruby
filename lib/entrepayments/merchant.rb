class Merchant
  attr_accessor :merchant_code,
                :merchant_key,
                :terminal

  def initialize(merchant_key, merchant_code, terminal)
    @merchant_key = merchant_key
    @merchant_code = merchant_code
    @terminal = terminal
  end
end