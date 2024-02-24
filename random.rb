members = %w[A B C D E F]
array_of_grouping = [2,3]
number = array_of_grouping.sample
p group_1 = members.sample(number).to_a.sort
p group_2 = members - group_1