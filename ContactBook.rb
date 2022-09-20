
# Contact Book Ruby
# Hansel Lopez

# This program will allow the user to create a contact book and interact with CRUD operations

# Create loop menu
class USER
    def initialize
        @contacts = []
    end

    def add_contact
        puts "\n"
        puts "Please enter the contact's first name"
        first_name = gets.chomp
        puts "\n"
        puts "Please enter the contact's last name"
        last_name = gets.chomp
        puts "\n"
        puts "Please enter the contact's phone number"
        phone = gets.chomp
        puts "\n"
        
        loop do
          puts "Please enter the contact's email"
            email = gets.chomp
            if email.include?("@") && email.include?(".")
                puts "\n"
                @contacts << {first_name: first_name, last_name: last_name, email: email, phone: phone}
                puts "\nYour contact has been created!!"
                break
            else
                puts "\nThe email is not valid!! (It must include @ and .)"
                # Press enter to continue
                puts "\n--Press enter to continue--".center(50)
                gets
            end
        end

        # Press enter to continue
        puts "\n--Press enter to continue--".center(50)
        gets
    end

    def display_contacts
        puts "\n"
        puts "#" * 50
        puts "These are the contacts in your contact book".center(50)
        puts "#" * 50
        puts "\n"
        @contacts.each do |contact|
            puts "Name: #{contact[:first_name]} #{contact[:last_name]}"
            puts "Phone: #{contact[:phone]}"
            puts "Email: #{contact[:email]}"
            puts "\n"
        end
        # Press enter to continue
        puts "Press enter to continue"
        gets
    end

    def delete_contact
        puts "Please enter your email to delete your contact"
        email = gets.chomp
        @contacts.each do |contact|
            if contact[:email] == email
                @contacts.delete(contact)

                puts "\nYour contact has been deleted!!"
                # Press enter to continue
                puts "\n--Press enter to continue--".center(50)
                gets
            end 
        end
        # Check if array is empty
        if @contacts.empty?
            puts "\nYou have no contacts!!"
            # Press enter to continue
            puts "\n--Press enter to continue--".center(50)
            gets
        end
    end

    def update_contact
        puts "Please enter your email to update your contact"
        email = gets.chomp
        puts "\n"

        # Check if email exists
        @contacts.each do |contact|
            if contact[:email] == email
              # Choose which field to update
              puts "Which field would you like to update?"
              puts "1. First Name"
              puts "2. Last Name"
              puts "3. Phone"
              puts "4. Email"
              field = gets.chomp
              puts "\n"

              case field
                when "1"
                  puts "Please enter your new first name"
                  first_name = gets.chomp
                  contact[:first_name] = first_name
                when "2"
                  puts "Please enter your new last name"
                  last_name = gets.chomp
                  contact[:last_name] = last_name
                when "3"
                  puts "Please enter your new phone number"
                  phone = gets.chomp
                  contact[:phone] = phone
                when "4"
                  puts "Please enter your new email"
                  email = gets.chomp
                  contact[:email] = email
              end
              puts "\nYour contact has been updated!!"
              # Press enter to continue
              puts "\n--Press enter to continue--".center(50)
              gets

            end
        end

        # Check if array is empty
        if @contacts.empty?
            puts "\nYou have no contacts!!"
            # Press enter to continue
            puts "\n--Press enter to continue--".center(50)
            gets
        end
    end

    def export_contacts_to_csv
        puts "\n"
        puts "Please enter the name of the file you want to export"
        file_name = gets.chomp
        File.open("#{file_name}.csv", "w") do |file|
            # Write headers
            file.write("First_Name, Last_Name, Phone, Email\n")
            @contacts.each do |contact|
                # Write to file separated by commas
                file.write("#{contact[:first_name]},#{contact[:last_name]},#{contact[:phone]},#{contact[:email]}" + "\n")
            end
        end
        puts "\nYour contacts have been exported!!"
        # Press enter to continue
        puts "\n--Press enter to continue--".center(50)
        gets
    end

    def run
        loop do
            puts "\n"
            puts "#" * 50
            puts "Welcome to your contact book".center(50)
            puts "#" * 50
            puts "\nPlease choose an option"
            puts "\n1. Add a contact"
            puts "2. Display contacts"
            puts "3. Delete a contact"
            puts "4. Update a contact"
            puts "5. Export contacts to CSV"
            puts "6. Exit"
            option = gets.chomp
            puts "\n"

            case option
                when "1"
                    add_contact
                when "2"
                    display_contacts
                when "3"
                    delete_contact
                when "4"
                    update_contact
                when "5"
                    export_contacts_to_csv
                when "6"
                    puts "\nGood bye!!"
                    # Press enter to continue
                    puts "\n--Press enter to finish--".center(50)
                    gets
                    exit
            end
        end
    end
end

user = USER.new
user.run
