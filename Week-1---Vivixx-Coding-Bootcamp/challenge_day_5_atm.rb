# Challenge: Joseph is in a rush to make a really important purchase. He has no money
# on him so he has gone to withdraw money from BPI but has found that there are serious
# issues with their systems! Can you reprogram the atm so he can buy his romance novel??"

# Completed: 6/10/2017 by William A. Mooney

# Database with Account Info - Completed
# Intro Screen - Create a fancy intro screen.. WOOT!!! - Unfinished
# Account Validation - Completed
# Accout Overview - Completed
# Balance Inquery - Completed
# Withdrawal with balance statement - Completed
# Exit to Intro Screen - Completed

$database = [{
  name: "Joseph Peters",
  balance: 3232.00,
  accountNum: 122354896127,
  cardNum: 9982635412527589,
  pin: 9892
  }, {
  name: "Jason Bruno",
  balance: 1232.00,
  accountNum: 122354897723,
  cardNum: 9982621312527963,
  pin: 9812
  }, {
  name: "Kyle Roat",
  balance: 2232.00,
  accountNum: 122354918472,
  cardNum: 9982635412527589,
  pin: 1323
  }]

def banner
  p "=".center(50, '=');
  p 'BPI ATM System'.prepend(' ').concat(' ').center(50, '=');
  p "=".center(50, '=');
end

def introScreen
  system"cls";
  banner();
  p " "*50;
  p "Welcome to BPI ATM.";
  p "Please note that some functions are out of order.";
  redirectToVerification();
end

def redirectToVerification
  p "Would you like to access your account now? [y/n]"
  redirectToCardVerification = gets.chomp.strip.downcase;

  if redirectToCardVerification == "yes" || redirectToCardVerification == "y"
    cardVerification();
  elsif redirectToCardVerification == "exit" || redirectToCardVerification == "e"
    system"cls";
    exit;
  elsif redirectToCardVerification == "ad.min"
    adminPrivileges(); # => It's good to be the admin...
  else
    introScreen();
  end
end

def adminPrivileges
  system"cls"
  banner();
  p "-"*47;
  p "Welcome Admin"
  p "Please select from the list of commands:";
  p "1 - Account Information";
  p "2 - Access individual accounts";
  p "3 - Exit Admin System";
  p "-"*47;
  @cmdAdmin = gets.chomp.strip.to_i;

  case @cmdAdmin
  when 1
    adminInfo(); # ACCOUNT INFO FROM DATABASE
  when 2
    adminBackdoor(); # BACKDOOR ACCESS
  when 3
    introScreen();
  else
    adminPrivileges();
  end
end

def adminInfo
  i = 0;
  while i < $database.length
    p "Account number: #{$database[i][:accountNum]}";
    p "Name: #{$database[i][:name]}".ljust(30) + "Balance: $" + sprintf("%0.2f", $database[i][:balance]).rjust(6);
    p "-"*47;

    i += 1;
  end
  redirectToAdminPrivileges();
end

def adminBackdoor
  p "Enter the twelve digit account number to access it:"
  @backdoor = gets.chomp.strip.to_i;

  # I'm sure there are better solutions then hardcoding this backdoor.
  # Perhaps an algorithm would automate the process which would work
  # when information is adjusted in the database but for now this
  # will do...

  case @backdoor
    when 122354896127
      @index = 0;
      accountOverview();
    when 122354897723
      @index = 1;
      accountOverview();
    when 122354918472
      @index = 2;
      accountOverview();
    when 1234
      adminPrivileges();
    else
      adminBackdoor();
    end
end

def cardVerification
  system"cls"
  banner();
  p " "*50;
  p "Our card reader is temporarily out of order."
  p "Please enter your 16 digit card number now:"
  @cardInput = gets.chomp.strip.to_i;
  i = 0;
  @cardFound = false;

  while i < $database.length
    if @cardInput == $database[i][:cardNum]
      @index = i;
      @cardFound = true;
      pinVerification();
    end
    i += 1;
  end

  if @cardFound == false
    p "Your sixteen digit card number wasn't found on file.  Try again? [y/n]"
    @reattemptCard = gets.chomp.strip.downcase;
    if @reattemptCard == "yes" || @reattemptCard == "y"
      cardVerification();
    else
      introScreen();
    end
  end
end

def pinVerification
  p "Please enter your four digit pin number now:"
  @pinInput = gets.chomp.strip.to_i;
  if @pinInput == $database[@index][:pin]
    accountOverview();
  else
    p "Access Denied: The four digit pin was incorrect.";
    p "Would you like to try again? [y/n]"
    @reattemptPin = gets.chomp.strip.downcase;
    if @reattemptPin == "yes" || @reattemptPin == "y"
      pinVerification();
    else
      introScreen();
    end
  end
end

def accountOverview
  system"cls"
  banner();
  p " "*50;
  p "Welcome to the account overview:";
  p "Thank you #{$database[@index][:name]} for being a valued customer.";
  p "Account #: #{$database[@index][:accountNum]}";
  p "Please select from the list of commands:";
  p "1 - Balance inquery";
  p "2 - Withdrawal of funds";
  p "3 - Exit account overview";
  p "-"*47;
  @cmdInput = gets.chomp.strip.to_i;

  case @cmdInput
  when 1
    balance();
  when 2
    withdrawal();
  when 3
    introScreen();
  else
    p "Invalid entry.  Please try again."
    redirectToOverview();
  end
end

def balance
  p "-"*47;
  p "Account number: #{$database[@index][:accountNum]}";
  p "Name: #{$database[@index][:name]}".ljust(30) + "Balance: $" + sprintf("%0.2f", $database[@index][:balance]).rjust(6);
  p "-"*47;
  redirectToOverview();
end

def redirectToOverview
  p " "*50;
  p "Would you like to go back to the account overview? [y/n]"
  redirectAcctOverview = gets.chomp.strip.downcase;

  if redirectAcctOverview == "yes" || redirectAcctOverview == "y"
    accountOverview();
  elsif redirectAcctOverview == "ad.min"
    adminPrivileges();
  else
    introScreen();
  end
end

def redirectToAdminPrivileges
  p " "*50;
  p "Would you like to go back to the admin overview? [y/n]"
  redirectAcctAdminOverview = gets.chomp.strip.downcase;

  if redirectAcctAdminOverview == "yes" || redirectAcctAdminOverview == "y"
    adminPrivileges;
  elsif redirectAcctAdminOverview == "ad.min"
    adminPrivileges();
  else
    introScreen();
  end
end

def withdrawal
  p "Please tell me the amount you want to withdraw?";
  amountWithdrawal = gets.chomp.strip.to_f.round(2);

  if amountWithdrawal <= $database[@index][:balance]
    $database[@index][:balance] -= amountWithdrawal;
    p "Here is your $#{amountWithdrawal}  Your new balance is: $" + sprintf("%0.2f", $database[@index][:balance]);
  else
    p "Withdrawal declined due to insufficient funds."
    p "The amount requested $#{amountWithdrawal} is greater then your funds available: $#{$database[@index][:balance]}";
    redirectToOverview();
  end

  redirectToOverview();
end

def executeProgram
  introScreen();
end

executeProgram();
