# file.methods.sort
# Open:
# Close:
# Read:
# Write:

# Ask for filename
# print "Type the file name: ";
# filename = gets.chomp.strip;

# //Create// Open the file and save it to opened_file variable
# opened_file = File.open(filename, 'a+');

# Print to the terminal screen
# p "Opened file name #{filename}";
# p "="*15;
# print opened_file.read;

# Get the file
print "Type in the file name: ";
filename = gets.chomp.strip;

# Open file in append-plus-read mode and store reference in opened_file variable
opened_file = File.open(filename, 'a+');

# Ask for a new city name
p "Add another Filipino city: ";
city = gets.chomp.strip;

# Write city name to the file
opened_file.write(city);
opened_file.write("\n");

# Rewind pointer at beginning of file
opened_file.rewind;
p "="*15;

# Read entire file from the beginning to end
print opened_file.read;

# We are done with the file
opened_file.close;

##############
p "Give your file a name (without .txt extension!)";

# creates the new file and adds the .txt file type enxtension
opened_file
