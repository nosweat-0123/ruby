require_relative 'pokemon'
require_relative 'pikachu'
class Main < Pokemon
  # nameメソッドにprotectedをつける前に作成した確認用ファイル

  riza = Pokemon.new('リザードン', 'ほのお', 'ひこう', 100, 100)
  puts riza.name
  puts riza.attack
  pika = Pikachu.new('ピカチュウ', 'でんき', '', 100, 100)
  puts pika.attack
  puts pika_2 = Pikachu.new('ピカチュウ', 'でんき', '', 100, 100).method(:attack).super_method.call
  puts pika.change_name('うんこ')
  pika.change_name('サトシのピカチュウ')
  puts pika.name
end
