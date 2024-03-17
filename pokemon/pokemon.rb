module GetAndEditName
  def change_name(new_name)
    if new_name == 'うんこ'
      print '不適切な名前です。'
    else
      @name = new_name
    end
  end

  def getting_name
    name
  end
end

class Pokemon
  attr_reader :name, :type1, :type2, :hp, :mp
  protected :name

  include GetAndEditName

  def initialize(name, type1, type2, hp, mp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
    @mp = mp
  end

  def attack
    "#{@name}のこうげき！"
  end
end
