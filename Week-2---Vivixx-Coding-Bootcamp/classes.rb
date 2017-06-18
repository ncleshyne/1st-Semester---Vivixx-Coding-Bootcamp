class Name
  attr_reader :title, :first_name, :middle_name, :last_name;
  attr_writer :title, :first_name, :middle_name, :last_name;
  attr_accessor # Basically does reader & writer functionality in one

  def initialize(title, first_name, middle_name, last_name)
    @title = title;
    @first_name = first_name;
    @middle_name = middle_name;
    @last_name = last_name;
  end

  def full_name
    @first_name + " " + @middle_name + " " + @last_name;
  end

  def full_name_with_title
    @title + " " + full_name();
  end
#  def title=(new_title)
#    @title = new_title;
#  end
end

name = Name.new("Mr", "William", "Adolph", "Mooney");
p name.title + " " + name.full_name;
p name.full_name_with_title;

#####################################################################

class BankAccount
  attr_reader :name

  def initialize(name)
    @name = name
    @transactions = []
    add_transaction("Beginning Balance", 0)
  end

  def credit(description, amount)
    add_transaction(description, amount)
  end

  def debit(description, amount)
    add_transaction(description, -amount)
  end

  def add_transaction(description, amount)
    @transactions.push(description: description, amount: amount)
  end

  def balance
    balance = 0.0
    @transactions.each do |transaction|
      balance += transaction[:amount]
    end
    return balance
  end

  def to_s
    "Name: #{name}, Balance: #{sprintf("%0.2f", balance)}"
  end

  def print_register
    puts "#{name}'s Bank Account"
    puts "-" * 40

    puts "Description".ljust(30) + "Amount".rjust(10)
    @transactions.each do |transaction|
      puts transaction[:description].ljust(30) + sprintf("%0.2f", transaction[:amount]).rjust(10)
    end

    puts "-" * 40
    puts "Balance:".ljust(30) + sprintf("%0.2f", balance).rjust(10)
    puts "-" * 40
  end

end

bank_account = BankAccount.new("Jason")
bank_account.credit("Paycheck", 100)
bank_account.debit("Groceries", 40)
bank_account.debit("Gas", 10.51)
puts bank_account
puts "Register:"
bank_account.print_register
