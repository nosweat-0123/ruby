require 'date'
require 'optparse'

opt = OptionParser.new
opt.on('-m')
opt.parse!(ARGV)
selected_month = ARGV[0].to_i

print "      #{selected_month}月"
puts Date.today.year.to_s

puts Date.today
week_today = Date.today.cwday

weeks = {monday: '月',tuesday: ' 火',wednesday: ' 水',thursday: ' 木',friday: ' 金',saturday: ' 土',sunday: ' 日'}
weeks.each do |key, value|
    print value.to_s
end



