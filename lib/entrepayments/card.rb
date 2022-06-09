class Card
  CREDITCARD = 1
  DEBITCARD = 2
  USE3DS = true
  THREEDSECUREVERSION1 = 1
  THREEDSECUREVERSION2 = 2

  attr_accessor :account_type,
                :pan,
                :expiration,
                :holder_name,
                :cvv,
                :three_d_secure,
                :three_d_secure_version,
                :card_brand,
                :card_country,
                :identifier

  def initialize(account_type, pan = nil, expiration_year = nil, expiration_month = nil, holder_name = nil, cvv = nil, identifier = nil)
    @account_type = account_type

    if identifier.nil?
      @identifier = identifier
    else
      @pan = pan
      @expiration = expiration_year + expiration_month
      @holder_name = holder_name
      @cvv = cvv
    end
  end

  def self.credit_card(pan, expiration_year, expiration_month, holder_name, cvv)
    Card.new(CREDITCARD, pan, expiration_year, expiration_month, holder_name, cvv)
  end

  def self.debit_card(pan, expiration_year, expiration_month, holder_name, cvv, three_d_secure_version = nil)
    three_d_secure_version ||= THREEDSECUREVERSION2

    card = Card.new(DEBITCARD, pan, expiration_year, expiration_month, holder_name, cvv)
    card.three_d_secure_version = three_d_secure_version

    card
  end

  def self.token(identifier)
    Card.new(CREDITCARD, identifier)
  end
end