class Dog
  def initialize(name, breed, sex)
    @name = name;
    @breed = breed;
    @sex = sex;
  end

  def speak
    if sex.downcase == "male"
      p "BARK!";
    else
      p "bark.";
    end
  end


end


# dog_name = gets.chomp.strip;



class Customer
  def initialize
    @details = details;
  end

  def print_customer_details
    p "Customer details:";
    p "Name: #{@details[:name]}";
    p "Month #{@details[:month]}";
    p "Age: #{@details[:age]}";
    p "="*15;
  end
end

# pedro = Customer.new({ name: "Pedro", month: "Enero", age: 21 });

# pedro.print_customer_details();


#############################

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name;
    @age = age;
  end

  #Getters = attr_reader
#  def name
#    @name
#  end

#  def age
#    @age
#  end

  #Setter = attr_writer
#  def name=(name)
#    @name = name
#  end

#  def bar=(age)
#    @age = age
#  end

  #Accessor = attr_accessor which automatically set's up the GETTER & SETTER functions

end

#john = Person.new("John", 42);
#p "#{john.age} " + john.name;
#john.age = 33;
#p "#{john.age} " + john.name;
#john.name = "Ted";
#p john.name;

# Challenge
# Create a simple banking app, to get the customer
# details: name, email, account, address, contact info
# Calculate and display the balance
# Use: attr_accessor
