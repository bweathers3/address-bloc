
# address book model

require_relative 'entry'
require "csv"


class AddressBook

    attr_accessor :entries

    def initialize

     @entries = []

    end

    ##############

    def good_bye_all_entries

        entries.delete_if { |item| item != nil}

    end

    ###############




       def add_entry(name, phone_number, email)

         index = 0

         entries.each do |entry|

           if name < entry.name
             break
           end

           index += 1

         end

         entries.insert(index, Entry.new(name, phone_number, email))

       end

       def import_from_csv(file_name)
            # Implementation goes here
            csv_text = File.read(file_name)
            csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

            csv.each do |row|
              row_hash = row.to_hash
              add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
            end
       end
###########

       def remove_entry(name, phone_number, email)

         delete_index = 0

         entries.each do |remove_entry|

           if name == remove_entry.name && phone_number == remove_entry.phone_number && email == remove_entry.email

             entries.delete_at(delete_index)

           end

           delete_index += 1

         end

      end
###########

   # Search AddressBook for a specific entry by name
   def binary_search(name)


      lower = 0
      upper = entries.length - 1


      while lower <= upper

        mid = (lower + upper) / 2
        mid_name = entries[mid].name


        if name == mid_name
          return entries[mid]
          elsif name < mid_name
            upper = mid - 1
          elsif name > mid_name
            lower = mid + 1
          end
        end


        return nil

   end


##############

   # Search AddressBook for a specific entry by name

   def iterative_search(name)


           lower = 0
           upper = entries.length - 1

           while lower <= (upper)

             if  entries[lower].name == name

               return entries[lower]

             else

               lower += 1

             end

           end

             return nil


   end

##############



end
