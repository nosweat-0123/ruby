both_of_scores = []
while score_data = gets
    both_of_scores << score_data.chomp.split(',')
end
#規定打数の配列
regulation_number_of_strokes = both_of_scores[0]
#実際の打数の配列
actual_strokes = both_of_scores[1]

result = []
regulation_number_of_strokes.zip(actual_strokes) do |r,a|
    n = r.to_i - a.to_i
    
    if a.to_i == 1 && r.to_i == 5
        result << "コンドル"
    elsif a.to_i == 1
        result << 'ホールインワン'
    elsif n <= -2
        result << "#{-n}ボギー"
    else
        SCORE_MAPPING = {
            3 => 'アルバトロス',
            2 => 'イーグル',
            1 => 'バーディ',
            0 => 'パー',
            -1 => 'ボギー'
        }
        result << SCORE_MAPPING[n]
    end
end
print result.join(',')


