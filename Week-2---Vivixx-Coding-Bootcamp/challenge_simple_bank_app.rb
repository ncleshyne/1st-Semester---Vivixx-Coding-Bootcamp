# Challenge
# Create a simple banking app, to get the customer
# details: name, email, account, address, contact info
# Calculate and display the balance
# Use: attr_accessor

# Completed: 6/13/2017 by William A. Mooney

class BankAccount
  attr_accessor :name, :email, :account, :address, :contact

  def initialize(name, email, account, address, contact)
    @name = name;
    @email = email;
    @account = account;
    @address = address;
    @contact = contact;
    @transactions = [];
    add_transaction("Beginning Balance", 0);
  end

  def credit(description, amount)
    add_transaction(description, amount);
  end

  def debit(description, amount)
    add_transaction(description, -amount);
  end

  def add_transaction(description, amount)
    @transactions.push(description: description, amount: amount);
  end

  def balance
    balance = 0.0;
    @transactions.each do |transaction|
      balance += transaction[:amount];
    end
    return balance
  end

  def to_s
    "Name: #{name}, Balance: $#{sprintf("%0.2f", balance)}";
  end

  def print_register
    p "#{name}'s Bank Account";
    p "Account #: #{account}".ljust(28) + "Contact #: #{contact}".rjust(15);
    p "Address: #{address}";
    p "Email: #{email}".ljust(35);
    p "-" * 50;

    p "Description".ljust(35) + "Amount".rjust(15);
    @transactions.each do |transaction|
      p transaction[:description].ljust(35) + sprintf("%0.2f", transaction[:amount]).rjust(15);
    end

    p "-" * 50;
    p "Balance:".ljust(35) + sprintf("%0.2f", balance).rjust(15);
    p "-" * 50;
  end

end

#name, email, account, address, contact
bank_account = BankAccount.new("Jason", "jason@jason.com", 128965430945, "12 Hoppe rd, Unionville, Michigan, USA", "09956501909");
bank_account.credit("Paycheck", 100)
bank_account.debit("Groceries", 40)
bank_account.debit("Gas", 10.51)
p bank_account
p "Register:"
bank_account.print_register
