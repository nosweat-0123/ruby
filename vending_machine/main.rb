require_relative 'vending_machine'
require_relative 'suica'
require_relative 'juice'

class Main < VendingMachine
  suica1 = Suica.new
  # 最初のチャージ残高を取得
  puts suica1.check_deposit
  # 100円以上の任意の金額をチャージ
  puts suica1.charging(5000)
  # #100円未満で例外を発生
  puts suica1.charging(99)

  vendingmachine = VendingMachine.new
  # ジュースの在庫を取得
  puts vendingmachine.check_stocks

  # それぞれのドリンクを購入できるか確認
  puts vendingmachine.judge_to_buy_juice(suica1,PEPSI)
  puts vendingmachine.judge_to_buy_juice(suica1,IROHASU)
  puts vendingmachine.judge_to_buy_juice(suica1,MONSTER)

  # それぞれのドリンクを購入と売り上げ確認
  puts vendingmachine.buy_juice(suica1,PEPSI)
  puts vendingmachine.buy_juice(suica1,IROHASU)
  puts vendingmachine.buy_juice(suica1,MONSTER)
  puts vendingmachine.check_stocks
  puts vendingmachine.check_current_sales

  # Suica2で、購入時の例外を確認
  suica2 = Suica.new
  puts vendingmachine.buy_juice(suica2,PEPSI)
  puts vendingmachine.buy_juice(suica2,PEPSI)
  puts vendingmachine.buy_juice(suica2,PEPSI)
  puts vendingmachine.buy_juice(suica2,PEPSI)

  # 在庫補充
  puts vendingmachine.restock_juice(PEPSI)
  puts vendingmachine.restock_juice(IROHASU)
  puts vendingmachine.restock_juice(MONSTER)
  # 補充されたか確認
  puts vendingmachine.check_stocks

  # 購入できるドリンクのリストを表示
  puts vendingmachine.list(suica1)
  
end
