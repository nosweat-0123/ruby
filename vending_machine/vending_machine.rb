require_relative 'juice'
require_relative 'suica'

class VendingMachine
  @@STOCKS = []
  @@SALES = 0
  PEPSI = Juice.new('pepsi', 150)
  MONSTER = Juice.new('monster', 230)
  IROHASU = Juice.new('irohasu', 120)
  # デフォルトの在庫
  5.times { @@STOCKS << PEPSI }
  5.times { @@STOCKS << MONSTER }
  5.times { @@STOCKS << IROHASU }

  # 在庫を確認するメソッド
  def check_stocks
    @@STOCKS.map do |stock|
      "#{stock.name}: #{stock.price}"
    end
  end

  # 補充するメソッド
  def restock_pepsi
    @@STOCKS << PEPSI
    'ペプシを在庫に１本追加しました。'
  end

  def restock_monster
    @@STOCKS << MONSTER
    'モンスターを在庫に１本追加しました。'
  end

  def restock_irohasu
    @@STOCKS << IROHASU
    'いろはすを在庫に１本追加しました。'
  end

  # 購入できるか判断するメソッド
  def judge_to_buy_pepsi(suica)
    if suica.deposit.to_i >= 150
      'ペプシを購入できます。'
    else
      'Suica残高が足りません。'
    end
  end

  def judge_to_buy_monster(suica)
    if suica.deposit.to_i >= 230
      'モンスターを購入できます。'
    else
      'Suica残高が足りません。'
    end
  end

  def judge_to_buy_irohasu(suica)
    if suica.deposit.to_i >= 120
      'いろはすを購入できます。'
    else
      'Suica残高が足りません。'
    end
  end

  # 売り上げをチェックするメソッド
  def check_current_sales
    "現在の売り上げは#{@@SALES}円です。"
  end

  # 購入可能なドリンクのリストを取得するメソッド
  def list(suica)
    clear_list = @@STOCKS.uniq
    price_compare =
      clear_list.select do |stock|
        suica.deposit >= stock.price
      end
    can_purchase_drinks =
      price_compare.map do |can_purchase_stock|
        "#{can_purchase_stock.name}: #{can_purchase_stock.price}円"
      end
    "このSuicaで購入可能なドリンクを表示します。
        #{can_purchase_drinks}"
  end

  # ドリンクを購入するメソッド
  def buy_pepsi(suica)
    if suica.deposit >= 150 && @@STOCKS.include?(PEPSI)
      @@STOCKS.delete_at(@@STOCKS.index(PEPSI))
      @@SALES += 150
      suica.deposit -= 150
      "ペプシを１本購入しました。このSuicaの残高は#{suica.deposit}円です。"
    elsif suica.deposit.to_i < 150 && @@STOCKS.include?(PEPSI)
      'Suica残高が足りません。'
    else
      '在庫がありません。'
    end
  end

  def buy_monster(suica)
    if suica.deposit >= 230 && @@STOCKS.include?(MONSTER)
      @@STOCKS.delete_at(@@STOCKS.index(MONSTER))
      @@SALES += 230
      suica.deposit -= 230
      "モンスターを１本購入しました。このSuicaの残高は#{suica.deposit}円です。"
    elsif suica.deposit.to_i < 230 && @@STOCKS.include?(MONSTER)
      'Suica残高が足りません。'
    else
      '在庫がありません。'
    end
  end

  def buy_irohasu(suica)
    if suica.deposit >= 120 && @@STOCKS.include?(IROHASU)
      @@STOCKS.delete_at(@@STOCKS.index(IROHASU))
      @@SALES += 120
      suica.deposit -= 120
      "いろはすを１本購入しました。このSuicaの残高は#{suica.deposit}円です。"
    elsif suica.deposit.to_i < 120 && @@STOCKS.include?(IROHASU)
      'Suica残高が足りません。'
    else
      '在庫がありません。'
    end
  end
end
