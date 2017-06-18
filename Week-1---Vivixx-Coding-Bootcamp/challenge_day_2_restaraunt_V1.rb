# The listed challenge:
# "William runs a small resturant here in Baguio. He has been looking for ways to cut costs and has realised
# that largest expense is Michael, his cashier. You are to use what you have learned to try and help Marc
# reduce the costs in his business"
# Completed: 6/6/2017 by William A. Mooney

wantMore = "yes";
sum = 0;

while wantMore == "yes" || wantMore == "y"
  puts "Welcome to Mooney's Restaurant."
  puts "Tell me the price of the item."
  itemPrice = gets.chomp.to_f;
  puts "Do you have more items?"
    wantMore = gets.chomp.downcase;
   sum += itemPrice;
end

puts "You owe: #{sum.round(2)}.  You may pay the funds into the payment processor now.";
