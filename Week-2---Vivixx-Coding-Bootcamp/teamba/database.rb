# Challenge listed below:
# Build a group of 3 people
# - 1 Unit Tester
# - 2 Implementers (UI/UX and Database)
# Write a program that will "IMPRESS ACE". You are to do this until tomorrow 4pm
# Presentations will go as follows:
# 1. State the problem and your solution
# 2. Demo the output
# 3. Show your code and explain

# Team TEAMBA - Dea Lorenzo, Reggie Cabutotan, Marc Macariola & William A. Mooney
# Completed: 6/16/2017 by TEAMBA - // UNFINISHED //


require'csv'

$memberlist = CSV.read('memberlist.csv', headers:true);
@database = CSV.read('database.csv', headers:true);

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
  # needs to be attached to timestamp..etc
  p "Please login now"
  getTimestamp();
end



def getTimeStampInfo
  # name
  # reason code
  # IF logged in today = false
  #     Login
  #     Get Time.now
  # ELSIF - Login today = true
  #     Logout
  #     Get Time.now
  # END
  #
  # Send info to database
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
    # Kick back to the login screen to Login
    p "In 10 seconds you will be redirected."  #####CHANGE LATER######
    sleep(10); ## Needs to be changed to a redirect option to introscreen
    introScreen();
  else
    p "Please try again.";
    newMember();
  end
end


########################### NEEDS TO BE COMPLETED #############
def getTimestamp
  # Enter name - Need to verify existing name on file
  print "Enter name: ";
  name = gets.chomp.strip;

  if nameonrecord(name) == true
    p "Welcome member."
  else
    p "Your name is not on record."
    print "Would you like to create a profile? [y/n]";
    p "Note: Currently assumes YES..will be updated later with choices"
    p "In 10 seconds you will be redirected."  #####CHANGE LATER######
    sleep(10); ## Needs to be changed to a redirect option to introscreen
    newMember();
    # If yes then direct to newMember
    # Else - go back to introScreen
    ###############  COMPLETE THIS #########################
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
  p "In 10 seconds you will be redirected."  #####CHANGE LATER######
  sleep(10); ## Needs to be changed to a redirect option to introscreen
  introScreen();
end

def getReason
  # Reason codes
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
    p "Please enter a valid numeric reason code."
    getReason();  # Will retry the whole method
  end
end

def readCSV
  # Throws the CSV file into database variable as one big multidimensional array
  @database = CSV.read('database.csv', headers:true);  # Make sure - headers:true

  # Does basically the same thing as the above code
#  @database = Array.new;
#  CSV.foreach('database.csv') do |record|
#    @database << record
#  end

  # Prints each row line by line
  CSV.foreach('database.csv') do |row|
    p row.inspect
  end
end

##########################  Admin Functions Below #################################
                ##########  UNFINISHED  ##########
def adminScreen
  # Should output statistics etc..
end

def printTimestamp  # This prints the whole list, eventually should be able to select individual names
  i = 0;
  p "="*50;
  p "Timestamp records:";
  while i < @database.length
    p "Name: #{@database[i][0]}, Reason: #{@database[i][1]}, Timestamp: #{@database[i][2]}";
    i+=1;
  end
  p "="*50;
end

def printMemberList  ## Modify for Memberlist
  i = 0;
  p "="*50;
  p "Memberlist records:";
  while i < @database.length
    p "Name: #{@database[i][0]}, Reason: #{@database[i][1]}, Timestamp: #{@database[i][2]}";
    i+=1;
  end
  p "="*50;
end


#########################################  TESTING BELOW  ##############################
#printTimestamp();
# variable = "Frank Thomas";
#newMember();
# if nameonrecord(variable) == true
#  p "It is true."
# else
#  p "It is false"
#end

#newMember();
# p $memberlist[0];p $memberlist[1];p $memberlist[2];

introScreen();
