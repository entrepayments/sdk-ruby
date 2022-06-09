class Payment
  AUTHORIZATIONWITHOUT3DS = "A"
  AUTHORIZATIONWITH3DS = "1"
  PREAUTHORIZATION = "1"
  AUTHORIZATIONCONFIRMATION = "2"
  CANCELMENT = "3"
  PREAUTHORIZATIONCANCELMENT = "9"

  attr_accessor :order,
                :card,
                :environment,
                :soft_descriptor,
                :installments,
                :secure_payment,
                :authentication_url,
                :authorization_code,
                :language,
                :nsu,
                :processed_paymethod,
                :response,
                :response_int,
                :pa_request,
                :md,
                :merchant_data,
                :state,
                :transaction_type

  def initialize(order, card = nil, soft_descriptor = "", installments = 1)
    @order = order
    @card = card
    @soft_descriptor = soft_descriptor
    @installments = installments
  end

  def set_installments(installments)
    @installments = installments

    self
  end
end