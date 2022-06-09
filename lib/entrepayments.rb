Dir['./lib/entrepayments/**/*.rb'].each { |f| require f }

# Classe principal do SDK
# @!attribute environment [Request::Environment]
class EntrePayments
  VERSION = "1.0.0"

  # @type [Request::Environment]
  attr_accessor :environment

  # @param environment [Request::Environment]
  def initialize(environment)
    @environment = environment
  end

  # @param merchant [EntrePayments::Merchant]
  # @param production [boolean]
  def self.create(merchant, production = true)
    EntrePayments.new(Request::Environment.new(merchant))
  end

  # @param payment [EntrePayments::Payment]
  # @param capture [Boolean]
  # @param tokenize [Boolean]
  def authorize(payment, capture = true, tokenize = false)
    @environment.authorize(payment, capture, false, tokenize)
  end

  # @param payment [EntrePayments::Payment]
  # @param transaction_type [String]
  def consult(payment, transaction_type = "1")
    @environment.consult(payment, transaction_type)
  end

  # @param payment [EntrePayments::Payment]
  def zero_dolar(payment)
    amount = payment.order.amount

    payment.order.amount = 0

    authorized = authorize(payment)

    payment.order.amount = amount

    authorized
  end

  # @param payment [EntrePayments::Payment]
  def capture(payment)
    @environment.capture(payment)
  end

  # @param payment [EntrePayments::Payment]
  def cancel(payment)
    @environment.cancel(payment, false)
  end

  # @param payment [EntrePayments::Payment]
  def void(payment)
    @environment.cancel(payment, true)
  end
end