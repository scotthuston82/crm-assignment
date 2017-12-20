class Contact

  @@contacts = []
  @@id  = 1000

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note = "N/A")
    @first_name = first_name
    @last_name  = last_name
    @email      = email
    @note       = note
    @id         = @@id
    @@id += 1
  end

  # Readers
  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def note
    @note
  end

  def id
    @id
  end

  # Writers
  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email=(email)
    @email = email
  end

  def note=(note)
    @note = note
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, notes = "N/A")
    new_contact = Contact.new(first_name, last_name, email, notes)
    @@contacts << new_contact
    new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find
    puts "Please enter an id"
    choice = gets.chomp.to_i
    @@contacts.each do |contact|
      if contact.id == choice
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update
    puts "which attribute would you like to change?"
    attribute = gets.chomp
    puts "What would you like to change the value to?"
    value = gets.chomp
    if attribute == "first_name"
      @first_name = value
    elsif attribute == "last_name"
      @last_name = value
    elsif attribute == "email"
      @email = value
    elsif attribute == "note"
      @note = value
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by
    puts "what would you like to search by?"
    search_by = gets.chomp
    puts "enter #{search_by}"
    value = gets.chomp
    @@contacts.each do |contact|
      if contact.first_name == value
        contact.display
      elsif contact.last_name == value
        contact.display
      elsif contact.email == value
        contact.display
      end

    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    "#{first_name } #{last_name}"
  end
  def self.del
    puts "Please enter an id to delete"
    choice = gets.chomp.to_i
    @@contacts.each do |contact|
      if contact.id == choice
        contact.delete
      end
    end
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  def display
    puts "First name: #{first_name} Last Name: #{last_name} email: #{email} note: #{note}"
  end
  # Feel free to add other methods here, if you need them.

end

scott = Contact.create("Scott", "Huston", "scotthuston1982@gmail.com")
batman = Contact.create("Bruce", "Wayne","bruce@wayne.com")
Contact.del
p Contact.all
