class Classmate
  def initialize(name, gender)
    @name = name.to_s;
    @gender = gender.to_s;
  end

  def about
    p "#{@name} is #{@gender}";
  end

end

classmate1 = Classmate.new('William', 'Male');
classmate2 = Classmate.new('Reggie', 'Male');
