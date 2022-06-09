module Request
  class Environment
    attr_accessor :merchant

    def initialize(merchant)
      @merchant = merchant
    end

    def is_production
      raise "Not implemented"
    end

    # Obtém o merchant
    #
    # @return [Request::Merchant]
    def get_merchant
      raise "Not Implemented"
    end

    # Obtém o user agent do SDK
    #
    # @return [String]
    def get_user_agent
      raise "Not implemented"
    end

    # Autoriza o pagamento
    #
    # @param payment [EntrePayments::Payment]
    # @param capture [Boolean]
    # @param recurring [Boolean]
    # @param tokenize [Boolean]
    def authorize(payment, capture, recurring, tokenize)
      raise "Not implemented"
    end

    def consult(payment, transaction_type)
      raise "Not implemented"
    end

    def capture(payment)
      raise "Not implemented"
    end

    def cancel(payment, pre_authorization)
      raise "Not implemented"
    end
  end
end