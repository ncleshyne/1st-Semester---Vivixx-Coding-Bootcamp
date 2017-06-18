# The listed challenge:
# "William runs a small resturant here in Baguio. He has been looking for ways to cut costs and has realised
# that largest expense is Michael, his cashier. You are to use what you have learned to try and help Marc
# reduce the costs in his business"

# Version 2 objective: Update your application with what was learned today.
# Version 2 Completed: 6/7/2017 by William A. Mooney

$menu = [
  { item: "sisig", price: 50 },
  { item: "papaitan", price: 50 },
  { item: "adobo", price: 40 },
  { item: "soimi", price: 20 },
  { item: "coke", price: 12 },
  { item: "water", price: 10 }
]

wantMore = "yes";
sum = 0;

p "Welcome to Mooney's Restaurant.";

# Removed the code asking for customer input of price of items and instituted a menu
def showMenu
  p "=====================";
  p "Here is the menu:";
  for i in 1..$menu.length
    p "#{$menu[i-1][:item]} = #{$menu[i-1][:price]} peso's."
  end
  p "=====================";
end

showMenu

while wantMore == "yes" || wantMore == "y"
  # Get the customers order
  p "What do you want to order?";
  chosen = gets.chomp.strip.downcase;
  p "How many would you like?";
  amount = gets.chomp.strip.to_i;

  # Checks if the item is part of the menu and adds the price
  $menu.each do |food|
    if chosen == food[:item]
      sum += (food[:price] * amount);
    end
  end

  # Continues or Ends the loop
  p "Do you want more items on your order? Yes or No?";
    wantMore = gets.chomp.strip.downcase;
end

total = sum.round(2);

if total == 0
  p "You don't owe anything.  Please come back when you would like to order something.";
else
  p "You owe: #{total} peso's.  You may pay the funds into the payment processor now.";

  # Process Payment Below
  p "How much money are you giving for payment?";
  money = gets.chomp.strip.to_i;

  if money >= total
    change = money - total;
    p "Your change is #{change} peso's.  Thank you and come back soon.";
  else
    p "You do not have enough to pay for your order.  Please get more funds or be prepared to wash dishes.";
  end
end
