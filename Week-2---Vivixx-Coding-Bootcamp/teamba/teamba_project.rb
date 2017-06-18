# Challenge listed below:
# Build a group of 3 people
# - 1 Unit Tester
# - 2 Implementers (UI/UX and Database)
# Write a program that will "IMPRESS ACE". You are to do this until tomorrow 4pm - 6/16/2017.
# Presentations will go as follows:
# 1. State the problem and your solution
# 2. Demo the output
# 3. Show your code and explain

# Team TEAMBA
# - Dea Lorenzo: Logo & Visual Design
# - Marc Macariola: Unit Tester
# - Reggie Cabutotan: Assistant to Dea & Marc
# - William A. Mooney (Christ Centered Developer): Lead Developer
# Completed: 6/16/2017 by TEAMBA

require'csv'
require_relative 'record.rb'

$memberlist = CSV.read('memberlist.csv', headers:true);
@database = CSV.read('database.csv', headers:true);

def logoScreen
  system"cls";
  puts %q{
     ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
      ██    ▄▄▄  ▄▄▄  ▄▄▄ ▄▄▄  ▄▄▄ ╓▄▄▄ ╓▄▄▄ ▄▄▄  ▄▄▄ ▄▄▄     ▐█▌
       █▌    ██  ██▀  ██▀  ██  ██▀  ██   ▀██ ██▀  ▀██ ██▀     █▌
        █▌    █▌ █▌   ██   └█▌╒█▌   ██    ▐███     ▐███      ██
        ▐█    ▐███    ██▄   ▐███   ╓██▄ ▄███▐██▄ ╓███ ██▄   ██
         ▀█▄▄▄▄██▄▄▄▄▄███▄▄▄▄██▄▄▄▄▄███▄▄██▄▄███▄▄██▄▄███▄▄▄█
          ███████████████████████████████████▀█▀████████████▌
           ███████▄███████████████████████████▄███████████▀▀
          ╢▒▒▒▒▒▒▒▀▀▀▀▀██████████████████████████▀▀▒▒╣╩╜▓▓
            ▐█╜╩▓╢╢╢╢╢╢╢╢╢╢╢▒▒▓▀██▓██▓▓▓█▓██▓▀▒╣╢▓╜║╥ ╩╜▓▓
             ██     ╙╨▓╢╢╢╢╢╢╢╢╢╢╢▒▓▓▓▓▓▓▓▒╢╣╩╜╓m╜║╥H╜║╟▀▌
              █▌         ╙╬╢╢╢╢╢╢╢╢╢╢╢╣╢╢▓╜ «Ç╓²║gM╜╙` █▌
              ▐█             ╩╢╢╢╢╢╢╢╢╣╝ «░╖«²        ██
               ▀████▄▄         ╙▓╢╢╢╢╝  ─`      ▄▄▄████
                ██████████▄▄▄,   ╙▓▓░    ,▄▄██████████
                 ████████████████▄▄▄▄▓███████████████▌
                  ▀▀▀██████████▓▓▓▓▓▓▓▓▓██████████▀▀
                        ▀▀▀████▓▓▓▓▓▓▓▓▓████▀▀
                              ▀▀▀█████▀▀
  };
  p " "*80;
  p '    A TEAMBA production';
  print "     Run application now? (y/n)...";
  run = gets.chomp.downcase.strip;
  if run == "y" || run == "yes"
    introScreen();
  elsif run == "e" || run == "exit"
    system"cls";
    exit;
  else
    logoScreen();
  end
end

# Will be modified with what DEA came up with
def banner
  p "=".center(71, '=');
  p 'Calle Uno Co-Work Station'.prepend(' ').concat(' ').center(71, '=');
  p "=".center(71, '=');
end

def introScreen
  system"cls";
  banner();
  p " "*71;
  p "Welcome to Calle Uno Co-Work Station";
  p "Would you like to login now? [y/n]";
  answer = gets.chomp.downcase.strip;

  if answer == "y" || answer == "yes"
    p "Please login now";
    getTimestamp();
  else
    logoScreen();
  end
end

def getTimestamp
  system"cls";
  banner();
  p " "*71;
  p "Welcome to Calle Uno Co-Work Station";
  print "Enter your name: ";
  name = gets.chomp.strip;

  if name == "ad.min"
    adminScreen();
  elsif nameonrecord(name) == true
    p "Welcome member."
  else
    p "Your Name: '#{name}' is not on record."
    p "Was this a typo? [y/n]"
    typo = gets.chomp.downcase.strip;

    if typo == "y" || typo == "yes"
      getTimestamp();
    else
      system"cls";
      banner();
      p " "*71;
      p "Please create your profile now."
      sleep(5);
      system"cls";
      banner();
      p " "*71;
      p "Account creation in progress...";
      newMember();
    end
  end

  getReason();

  # Once name & reason have been input then creates a timestamp
  timeStamp = Time.now;
  p "Name: #{name}, Reason: #{@reason}, Timestamp: #{timeStamp}";

  # Get the file to write to
  filename = "database.csv";

  # Open file in append-plus-read mode and store reference in opened_file variable
  opened_file = File.open(filename, 'a+');

  # Data to be added to CSV
  data = "#{name},#{@reason},#{timeStamp}";

  # Write the data to the file
  opened_file.write(data);
  opened_file.write("\n");

  # We are done with the file
  opened_file.close;

  p "Your timestamp has been logged."
  sleep(10); ## Needs to be changed to a redirect option to introscreen
  logoScreen();
end

def nameonrecord(name)  # Works
  i = 0;
  $memberlist = CSV.read('memberlist.csv', headers:true);

  while i < $memberlist.length
    if name == $memberlist[i][0];
      return true;
    end
    i+=1;
  end

  return false;
end

def newMember  # Works
  print "Please enter your name: ";
  name = gets.chomp.strip;
  print "Please enter your email address: "
  email = gets.chomp.strip;
  p "Name: #{name}, Email: #{email}";
  p "Is this correct? [y/n]";
  answer = gets.chomp.downcase.strip;

  if answer == "y" || answer == "yes"
    # Get the file - This will be automated in final product..
    filename = "memberlist.csv";

    # Open file in append-plus-read mode and store reference in opened_file variable
    opened_file = File.open(filename, 'a+');

    # Data to be added to CSV
    data = "#{name},#{email}";

    # Write the data to the file
    opened_file.write(data);
    opened_file.write("\n");

    # We are done with the file
    opened_file.close;
    p "You have been added to the member list."
    sleep(10);
    introScreen();
  elsif answer == "e" || answer == "exit"
    logoScreen();
  else
    system"cls";
    banner();
    p " "*71;
    p "Please try again.";
    sleep(5);
    system"cls";
    banner();
    p " "*71;
    p "Account creation in progress...";
    newMember();
  end
end

def getReason
  p "Reason code values:"
  p "1 - Regular Member";
  p "2 - Coding Bootcamp";
  p "3 - Drop-In Coworking";
  p "4 - Attend Event";
  p "5 - Guest/Other";
  print "Enter the numeric reason: ";
  reason = gets.chomp.strip;
  case reason
  when "1"
      @reason = "Regular Member";
  when "2"
      @reason = "Coding Bootcamp";
  when "3"
      @reason = "Drop-In Coworking";
  when "4"
      @reason = "Attend Event";
  when "5"
      @reason = "Guest/Other";
  else
    system"cls"
    banner();
    p "Welcome to Calle Uno Co-Work Station";
    p "Please enter a valid numeric reason code.";
    getReason();  # Will retry the whole method
  end
end



##########################  Admin Functions Below #################################
def adminScreen
  system"cls"
  banner();
  p "Welcome Admin.";
  adminOptions();
end

def adminOptions #### Working but incomplete ##########
  p "Available tasks:"
  p "1 - Print Timestamp records";
  p "2 - Print Member List";
  p "3 - Coming Soon - Print Timestamp's by Name";
  p "4 - Exit out of the Admin interface.";
  print "Enter the numeric value of your choice: ";
  choice = gets.chomp.strip;
  case choice
  when "1"
      printTimestamp();
      sleep(10);
      adminScreen();
  when "2"
      printMemberList();
      sleep(10);
      adminScreen();
  when "3"
      adminScreen();
  when "4"
      logoScreen();
  else
    system"cls"
    banner();
    p "Welcome Admin.";
    p "Please enter a valid numeric choice.";
    adminOptions();  # Will retry the whole method
  end
end

def printTimestamp  # This prints the whole list, eventually should be able to select individual names
  @database = CSV.read('database.csv', headers:true);
  i = 0;
  p "="*83;
  p "(Timestamp records)".prepend(' ').concat(' ').center(63, ' ');;
  p "="*83;
  while i < @database.length
    p "Name: #{@database[i][0]}, Reason: #{@database[i][1]}, Timestamp: #{@database[i][2]}";
    i+=1;
  end
  p "="*83;
end

def printMemberList
  $memberlist = CSV.read('memberlist.csv', headers:true);
  i = 0;
  p "="*58;
  p "      (Memberlist records)".prepend(' ').concat(' ').center(58, ' ');;
  p "="*58;
  while i < $memberlist.length
    p "Name: #{$memberlist[i][0]}".ljust(28) + "Email: #{$memberlist[i][1]}".rjust(15);
    i+=1;
  end
  p "="*58;
end

def printTimestampByName
  # Unfinished function - Ran out of time for the challenge
end

######################################################################################

logoScreen();
