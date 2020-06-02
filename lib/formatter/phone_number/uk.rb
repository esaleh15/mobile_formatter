require_relative "bad_format_error"

module Formatter
	module PhoneNumber
		module UK

			VALID_PREFIX = ['07', '447', '+447']

			def self.format(number)
				removed_space_no = remove_space(number)
			end

			def self.remove_space(number) # check for spaces
				number.match(/\s+/) ? number.gsub(/\s+/, "") : number
			end

			def self.is_valid(number) # check number for valid rules
				if number.start_with?(*VALID_PREFIX)
					if number.length == 11
						return number
					else
						raise BadFormatError.new('Invalid UK Number Length', 'Invalid Length')
					end
				else
					raise BadFormatError.new('Invalid UK Number Format', 'Bad Format')
				end
			end
		end
	end
end


