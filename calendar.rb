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
  weeks = [1, 2, 3, 4, 5, 6, 7]
  weeks.each do |n|
    case n
    when 1
      print '月'
    when 2
      print ' 火'
    when 3
      print ' 水'
    when 4
      print ' 木'
    when 5
      print ' 金'
    when 6
      print ' 土'
    when 7
      puts ' 日'
    end
  end

  # カレンダーを表示
  (first_day.day..last_day.day).each do |n|
    # 月曜始まりの時の処理
    if first_day.cwday == 1
      if n == 1
        print " #{n}"
        # １行目の日付の書き方
      elsif n < 10
        if (n % 7).zero?
          puts "  #{n}"
        elsif n % 7 == 1
          print " #{n}"
        else
          print "  #{n}"
        end
        # ２行目以降の日付の書き方
      elsif (n % 7).zero?
        puts " #{n}"
      elsif n % 7 == 1
        print n
      else
        print " #{n}"
      end
    # 火曜始まりの場合の処理
    elsif first_day.cwday == 2
      if n == 1
        print "    #{n}"
        # １行目の日付の書き方
      elsif n < 10
        if n % 7 == 6
          puts "  #{n}"
        elsif (n % 7).zero?
          print " #{n}"
        else
          print "  #{n}"
        end
        # ２行目以降の日付の書き方
      elsif n % 7 == 6
        puts " #{n}"
      elsif (n % 7).zero?
        print n
      else
        print " #{n}"
      end
    # 水曜始まりの場合の処理
    elsif first_day.cwday == 3
      if n == 1
        print "       #{n}"
        # １行目の日付の書き方
      elsif n < 10
        if n % 7 == 5
          puts "  #{n}"
        elsif n % 7 == 6
          print " #{n}"
        else
          print "  #{n}"
        end
        # ２行目以降の日付の書き方
      elsif n % 7 == 5
        puts " #{n}"
      elsif n % 7 == 6
        print n
      else
        print " #{n}"
      end
    # 木曜始まりの場合の処理
    elsif first_day.cwday == 4
      if n == 1
        print "          #{n}"
        # １行目の日付の書き方
      elsif n < 10
        if n % 7 == 4
          puts "  #{n}"
        elsif n % 7 == 5
          print " #{n}"
        else
          print "  #{n}"
        end
        # ２行目以降の日付の書き方
      elsif n % 7 == 4
        puts " #{n}"
      elsif n % 7 == 5
        print n
      else
        print " #{n}"
      end
    # 金曜始まりの場合の処理
    elsif first_day.cwday == 5
      if n == 1
        print "             #{n}"
        # １行目の日付の書き方
      elsif n < 10
        if n % 7 == 3
          puts "  #{n}"
        elsif n % 7 == 4
          print " #{n}"
        else
          print "  #{n}"
        end
        # ２行目以降の日付の書き方
      elsif n % 7 == 3
        puts " #{n}"
      elsif n % 7 == 4
        print n
      else
        print " #{n}"
      end
    # 土曜始まりの場合の処理
    elsif first_day.cwday == 6
      if n == 1
        print "                #{n}"
        # １行目の日付の書き方
      elsif n < 10
        if n % 7 == 2
          puts "  #{n}"
        elsif n % 7 == 3
          print " #{n}"
        else
          print "  #{n}"
        end
        # ２行目以降の日付の書き方
      elsif n % 7 == 2
        puts " #{n}"
      elsif n % 7 == 3
        print n
      else
        print " #{n}"
      end
    # 日曜始まりの場合の処理
    elsif n == 1
      puts "                   #{n}"
    # １行目の日付の書き方
    elsif n < 10
      if n % 7 == 1
        puts "  #{n}"
      elsif n % 7 == 2
        print " #{n}"
      else
        print "  #{n}"
      end
    # ２行目以降の日付の書き方
    elsif n % 7 == 1
      puts " #{n}"
    elsif n % 7 == 2
      print n
    else
      print " #{n}"
    end
  end
else
  # エラーメッセージを表示
  puts "#{selected_month} is neither a month number (1..12) nor a name"
end
