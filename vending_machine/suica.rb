class Suica
  attr_accessor :deposit
  attr_reader :check_deposit

  def initialize(deposit = 500)
    @deposit = deposit
  end

  def charging(amount)
    if amount >= 100
      @deposit += amount
      "#{amount}円チャージしました。このSuicaの残高は#{@deposit}円です。"
    else
      "100円未満はチャージできません。このSuicaの残高は#{@deposit}円です。"
    end
  end

  def check_deposit
    "このSuicaの残高は#{@deposit}円です。"
  end
end
