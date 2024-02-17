members = %w[A B C D E F]

def grouping1(group)
  group.shuffle.each_slice(3).to_a
end

def grouping2(group)
  group.shuffle.each_slice(4).to_a
end

grouping_pattern1 = grouping1(members)
grouping_pattern2 = grouping2(members)

grouped_members_array = [grouping_pattern1, grouping_pattern2]

shuffled_group = grouped_members_array.sample
p shuffled_group[0].sort
p shuffled_group[1].sort
