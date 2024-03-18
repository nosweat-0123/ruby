require_relative 'pokemon'

class Pikachu < Pokemon
  def attack
    "#{getName}の10万ボルト！"
  end

  # ピカチュウのテスト
  pika = Pikachu.new('ピカチュウ', 'でんき', '', 100, 100)
  puts pika.attack
end
