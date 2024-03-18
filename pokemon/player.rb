require_relative 'pokemon'

class Player
  attr_reader :name
  protected :name
  include GetAndEditName

  def initialize(name)
    @name = name
  end

  # Playerクラスのテスト
  player = Player.new('カスミ')
  puts player.getting_name
  puts player.change_name('タケシ')
end
