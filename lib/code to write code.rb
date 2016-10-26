$x = 1
$y = 1
$w = 1
$z = 1

13.times do
  puts "Card.new(:spades, #{$x+=1}),"
  puts "Card.new(:diamonds, #{$y+=1}),"
  puts "Card.new(:hearts, #{$w+=1}),"
  puts "Card.new(:clubs, #{$z+=1}),"
end

2.upto(14) do |i|
  puts "Card.new(:spades, #{i}),"
  puts "Card.new(:diamonds, #{i}),"
  puts "Card.new(:hearts, #{i}),"
  puts "Card.new(:clubs, #{i}),"
end


a = Array.new(52)
$x = 1
a.each do |cardEntry|
  puts "Card.new(:spades, #{$x+=1}),"
end