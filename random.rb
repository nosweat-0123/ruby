members = %w[A B C D E F]

group_1_1 = members.sample(2).to_a.sort
group_1_2 = members.sample(3).to_a.sort
group_1_array = [group_1_1, group_1_2]
p group_1 = group_1_array.sample
p group_2 = members - group_1

