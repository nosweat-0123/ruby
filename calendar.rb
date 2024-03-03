require 'date'
require 'optparse'

opt = OptionParser.new
opt.on('-m')
opt.parse!(ARGV)
selected_month = ARGV[0].to_i

if selected_month == 0
    selected_month = Date.today.month
end

if (1..12).cover?(selected_month)
  first_day = Date.new(Date.today.year, selected_month)
  last_day = Date.new(Date.today.year, selected_month, -1)
  # 年月を表示
  print "      #{selected_month}月"
  puts Date.today.year

  # 曜日を表示
  puts '月 火 水 木 金 土 日'

  # カレンダーを表示
  (first_day.day..last_day.day).each do |n|
    if n == 1
      if first_day.cwday != 7
        print " " * (3 * first_day.cwday - 2) + "#{n}"
      else
        puts " " * (3 * first_day.cwday - 2) + "#{n}"
      end
    #月曜始まりの処理
    elsif first_day.cwday == 1
      if n % 7 == 1
        print "#{n}".rjust(2," ")
      elsif n % 7 == 0
        puts "#{n}".rjust(3," ")
      else
        print "#{n}".rjust(3," ")
      end
    #火曜始まりの処理
    elsif first_day.cwday == 2
      if n % 7 == 0
        print "#{n}".rjust(2," ")
      elsif n % 7 == 6
        puts "#{n}".rjust(3," ")
      else
        print "#{n}".rjust(3," ")
      end
    #水曜始まりの処理
    elsif first_day.cwday == 3
      if n % 7 == 6
        print "#{n}".rjust(2," ")
      elsif n % 7 == 5
        puts "#{n}".rjust(3," ")
      else
        print "#{n}".rjust(3," ")
      end
    #木曜始まりの処理
    elsif first_day.cwday == 4
      if n % 7 == 5
        print "#{n}".rjust(2," ")
      elsif n % 7 == 4
        puts "#{n}".rjust(3," ")
      else
        print "#{n}".rjust(3," ")
      end
    #金曜始まりの処理
    elsif first_day.cwday == 5
      if n % 7 == 4
        print "#{n}".rjust(2," ")
      elsif n % 7 == 3
        puts "#{n}".rjust(3," ")
      else
        print "#{n}".rjust(3," ")
      end
    #土曜始まりの処理
    elsif first_day.cwday == 6
      if n % 7 == 3
        print "#{n}".rjust(2," ")
      elsif n % 7 == 2
        puts "#{n}".rjust(3," ")
      else
        print "#{n}".rjust(3," ")
      end
    #日曜始まりの処理
    elsif first_day.cwday == 7
      if n % 7 == 2
        print "#{n}".rjust(2," ")
      elsif n % 7 == 1
        puts "#{n}".rjust(3," ")
      else
        print "#{n}".rjust(3," ")
      end
    end
  end
else
  puts "#{selected_month} is neither a month number (1..12) nor a name"
end
