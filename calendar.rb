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
  (first_day..last_day).each do |day|
    if day == first_day
      if day.sunday?
        puts " " * (3 * day.cwday - 2) + "#{day.day}"
      else
        print " " * (3 * day.cwday - 2) + "#{day.day}"
      end
    elsif day.sunday?
      puts "#{day.day}".rjust(3," ")
    elsif day.monday?
      print "#{day.day}".rjust(2," ")
    else
      print "#{day.day}".rjust(3," ")
    end
  end
else
  puts "#{selected_month} is neither a month number (1..12) nor a name"
end
