module Formatter
	module PhoneNumber
		module UK
			def self.format(number)
				removed_space_no = remove_space(number)
			end

			def self.remove_space(number) # check for spaces
				number.match(/\s+/) ? number.gsub(/\s+/, "") : number
			end
		end
	end
end
