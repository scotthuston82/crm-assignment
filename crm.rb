require './contact.rb'

class CRM

  def initialize

  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then Exit
# Finish off the rest for 3 through 6
# To be clear, the methods add_new_contact and modify_existing_contact
# haven't been implemented yet
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "enter the id of the contact you would like to modify"
    modify = gets.chomp.to_i
    puts "which attribute would you like to change?"
    attribute = gets.chomp
    puts "What would you like to change the value to?"
    value = gets.chomp
    Contact.all.each do |contact|
      if contact.id == modify
        contact.update(attribute,value)
      end
    end
  end

  def delete_contact
    puts "enter the id of the contact you would like to delete"
    del = gets.chomp.to_i
    Contact.all.each do |contact|
      if contact.id == del
        contact.delete
      end
    end
  end

  def display_all_contacts
    p Contact.all
  end

  def search_by_attribute
    puts "what would you like to search by?"
    search_by = gets.chomp
    puts "enter #{search_by}"
    value = gets.chomp
    p Contact.find_by(search_by,value)
  end


end
scott = Contact.create("Scott","Huston","scott@huston.com")
first = CRM.new
first.main_menu
