require_relative 'pokemon'

class Zenigame < Pokemon
  def attack
    "#{getName}のみずでっぽう！"
  end

  # ゼニガメのテスト
  zenigame = Zenigame.new('ゼニガメ', '水', '', 100, 100)
  puts zenigame.attack
end
