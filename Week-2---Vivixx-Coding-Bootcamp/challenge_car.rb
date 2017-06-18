# Challenge
# Create a Car app which has a database of cars and a driver
# The Cars should have a make, age, top_speed, and gas_tank_size
# A driver should have name, cars, age and a contact
# Use attr_accessor to setup getters and setters
# Create the app so that we can have the car's make and age output to the terminal
#
# Completed: 6/14/2017 by William A. Mooney
# Ran out of time to make the application dynamic

$car_database = [];  # Newly created cars will be pushed to this database
$user_database = [];

class Car
  attr_accessor :make, :model_year, :top_speed, :gas_tank_size

  def initialize(make, model_year, top_speed, gas_tank_size)
    @make = make;
    @model_year = model_year;
    @top_speed = top_speed;
    @gas_tank_size = gas_tank_size;
  end
end

class Driver
  attr_accessor :name, :cars, :age, :contact

  def initialize(name, cars, age, contact)
    @name = name;
    @cars = cars;
    @age = age;
    @contact = contact;
  end
end

### Pre-Generated Vehicles ###################################
mustang_v6 = Car.new("Ford Mustang V6", "2016", "249", "16");
$car_database.push({ make: mustang_v6.make,
                     model_year: mustang_v6.model_year,
                     top_speed: mustang_v6.top_speed,
                     gas_tank_size: mustang_v6.gas_tank_size });
shelby_gt = Car.new("Ford Shelby GT", "2016", "299", "16");
$car_database.push({ make: shelby_gt.make,
                     model_year: shelby_gt.model_year,
                     top_speed: shelby_gt.top_speed,
                     gas_tank_size: shelby_gt.gas_tank_size });
camry = Car.new("Toyota Camry", "2015", "196", "17");
$car_database.push({ make: camry.make,
                     model_year: camry.model_year,
                     top_speed: camry.top_speed,
                     gas_tank_size: camry.gas_tank_size });
mx_5 = Car.new("Mazda MX-5", "2016", "209", "11.9");
$car_database.push({ make: mx_5.make,
                     model_year: mx_5.model_year,
                     top_speed: mx_5.top_speed,
                     gas_tank_size: mx_5.gas_tank_size });
## Pre-Generated Drivers #####################################
$ronald = Driver.new("Ronald", [
                   { make: mustang_v6.make,
                     model_year: mustang_v6.model_year,
                     top_speed: mustang_v6.top_speed,
                     gas_tank_size: mustang_v6.gas_tank_size },
                   { make: mx_5.make,
                     model_year: mx_5.model_year,
                     top_speed: mx_5.top_speed,
                     gas_tank_size: mx_5.gas_tank_size }
                    ], 33, "ronald@gmail.com");
$tyler = Driver.new("Tyler", [
                   { make: mustang_v6.make,
                     model_year: mustang_v6.model_year,
                     top_speed: mustang_v6.top_speed,
                     gas_tank_size: mustang_v6.gas_tank_size },
                   { make: camry.make,
                     model_year: camry.model_year,
                     top_speed: camry.top_speed,
                     gas_tank_size: camry.gas_tank_size }
                    ], 18, "tyler@gmail.com");
$josh = Driver.new("Josh", [
                   { make: shelby_gt.make,
                     model_year: shelby_gt.model_year,
                     top_speed: shelby_gt.top_speed,
                     gas_tank_size: shelby_gt.gas_tank_size },
                   { make: mx_5.make,
                     model_year: mx_5.model_year,
                     top_speed: mx_5.top_speed,
                     gas_tank_size: mx_5.gas_tank_size }
                    ], 24, "josh@gmail.com");

# Could try to throw the whole class into the database
##############################################################

def printCars
  i = 0;
  while i < $car_database.length
    p "Model Year: #{$car_database[i][:model_year]}, Make: #{$car_database[i][:make]}";
    p "Top speed: #{$car_database[i][:top_speed]} Kph, Tank size: #{$car_database[i][:gas_tank_size]} Liters";
    p "-"*77;
    i += 1;
  end
end

# :make, :model_year, :top_speed, :gas_tank_size
# Not implemented yet
def newCar
  system "cls";
  p "Enter the make of the car: ";
  make = gets.chomp.strip;
  p "Enter car model year: ";
  model_year = gets.chomp.strip;
  p "Enter car top speed in mph: ";
  top_speed = gets.chomp.strip;
  p "Enter gas tank size in Liter's: "
  gas_tank_size = gets.chomp.strip;
  $car_database.push(Car.new({ make: make, model_year: model_year, top_speed: top_speed, gas_tank_size: gas_tank_size }));
  p "Car has been uploaded to the database."
end

# :name, :cars, :age, :contact
# Not implemented yet
def newDriver
    system "cls";
    p "Enter your name: ";
    make = gets.chomp.strip;
    # Create a method to dynamically populate the available cars
    p "Select from the available cars database: ";
    cars = [];   # UPDATE LATER REQUIRED
    # NEEDS TO PUSH TO =>
    # Needs to be finished

    p "Enter your current age: ";
    age = gets.chomp.strip;
    p "Enter your phone number: "
    contact = gets.chomp.strip;
    $user_database.push(Driver.new({ name: name, cars: cars, age: age, contact: contact }));
    p "New driver profile has been uploaded to the database."
end

def banner
  p "=".center(50, '=');
  p "Driver's & Car's System".prepend(' ').concat(' ').center(50, '=');
  p "=".center(50, '=');
end

def introScreen
  system"cls";
  banner();
  userSelection();
end

def userSelection
  p " "*50;
  p "Welcome, please select from the available drivers: ";
  p "1 - Ronald";
  p "2 - Tyler";
  p "3 - Josh";
  @choice = gets.chomp.strip;
  driverSelection();
end

# Had to hard code this but given more time I could have made it dynamic
def driverSelection
  case @choice
  when "1"
    @nameIndex = $ronald;
    userInterface();
  when "2"
    @nameIndex = $tyler;
    userInterface();
  when "3"
    @nameIndex = $josh;
    userInterface();
  when "ad.min"
    # Admin access - create & edit vehicles/drivers;  Ran out of time for this...
  else
    throw "You haven't made a valid selection.  Choose 1-3.";
  end
end

def userInterface
  printDriverInfo();
  printDriverCars();
  redirectToIntro();
end

def redirectToIntro
  p "Would you like to go back to driver selection screen? [y/n]"
  redirectToIntroScreen = gets.chomp.strip.downcase;

  if redirectToIntroScreen == "yes" || redirectToIntroScreen == "y"
    introScreen();
  else
    system"cls";
    exit;
  end
end

# :name, :cars, :age, :contact
def printDriverInfo
    p "Name: #{@nameIndex.name}, Age: #{@nameIndex.age}";
    p "Contact: #{@nameIndex.contact}";
    p "Vehicle's owned:"
    p "-"*50;
end

def printDriverCars
  i = 0;
  while i < @nameIndex.cars.length
    p "Model Year: " + @nameIndex.cars[i][:model_year] + ", Make: " + @nameIndex.cars[i][:make];
    p "Top speed: " + @nameIndex.cars[i][:top_speed] + " Kph, Tank size: " + @nameIndex.cars[i][:gas_tank_size] + " Liters";
    p "-"*50;
    i += 1;
  end
end

introScreen();
