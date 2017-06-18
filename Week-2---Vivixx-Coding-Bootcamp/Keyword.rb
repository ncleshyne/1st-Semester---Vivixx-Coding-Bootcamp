# Pair up as one test writer and one implementation writer
# Completed: 6/14/2017 by William A. Mooney & Daniel M.

$keywordArr = ['Phones', 'Food', 'Computers', 'Restaurants', 'Banks', 'Clinics', 'Stage', 'Market', 'Shops', 'Parking Lot'];

def banner
  p "=".center(50, '=');
  p "SM Mall - Item's of Interest".prepend(' ').concat(' ').center(50, '=');
  p "=".center(50, '=');
end

def displayItems
  i = 0;
  n = 1;
  while i < $keywordArr.length
    p "Item - #{n}: #{$keywordArr[i]}";
    i += 1;
    n += 1;
  end
  p "-"*50;
  redirectToIntro();
end

def introScreen
  system"cls";
  banner();
  p "Welcome to the SM kiosk.";
  p "Would you like to see a list of the top ten items here?"
  choice = gets.chomp.downcase.strip;
  if choice == "y" || choice == "yes"
    displayItems();
  elsif choice == "e" || choice == "exit"
    system"cls";
    exit
  else
    introScreen
  end
end

def redirectToIntro
  p "Would you like to go back to the intro screen? [y/n]"
  redirectToIntroScreen = gets.chomp.strip.downcase;

  if redirectToIntroScreen == "yes" || redirectToIntroScreen == "y"
    introScreen();
  else
    redirectToIntro();
  end
end

introScreen();
