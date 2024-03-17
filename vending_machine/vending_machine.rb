require_relative 'juice'
require_relative 'suica'

class VendingMachine
  PEPSI = Juice.new('ペプシ', 150)
  MONSTER = Juice.new('モンスター', 230)
  IROHASU = Juice.new('いろはす', 120)

  def initialize(stocks = [],sales = 0)
    @stocks = stocks
    @sales = sales
    5.times { @stocks << PEPSI }
    5.times { @stocks << MONSTER }
    5.times { @stocks << IROHASU }
  end

  # 在庫を確認するメソッド
  def check_stocks
    grouped_stocks = @stocks.group_by{|juice| juice.name}
    grouped_stocks.map do |juice|
      "#{juice[0]}(¥#{juice[1][0].price}):#{juice[1].length}本"
    end
  end

  # 補充するメソッド
  def restock_juice(juice)
    @stocks << juice
    "#{juice.name}を在庫に１本追加しました。"
  end

  # 購入できるか判断するメソッド
  def judge_to_buy_juice(suica,juice)
    if suica.deposit.to_i >= juice.price
      "#{juice.name}を購入できます。"
    else
      'Suica残高が足りません。'
    end
  end

  # 売り上げをチェックするメソッド
  def check_current_sales
    "現在の売り上げは#{@sales}円です。"
  end

  # 購入可能なドリンクのリストを取得するメソッド
  def list(suica)
    clear_list = @stocks.uniq
    price_compare =
      clear_list.select do |stock|
        suica.deposit >= stock.price
      end
    can_purchase_drinks =
      price_compare.map do |can_purchase_stock|
        "#{can_purchase_stock.name}: #{can_purchase_stock.price}円"
      end
    "このSuicaで購入可能なドリンクを表示します。#{can_purchase_drinks}"
  end

  # ドリンクを購入するメソッド
  def buy_juice(suica,juice)
    if suica.deposit >= juice.price && @stocks.include?(juice)
      @stocks.delete_at(@stocks.index(juice))
      @sales += juice.price
      suica.deposit -= juice.price
      "#{juice.name}を１本購入しました。このSuicaの残高は#{suica.deposit}円です。"
    elsif suica.deposit.to_i < juice.price && @stocks.include?(juice)
      'Suica残高が足りません。'
    else
      '在庫がありません。'
    end
  end

end
