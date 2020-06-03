require_relative 'uk'
uk_phone_number = Formatter::PhoneNumber::UK
formatter = uk_phone_number.format(ARGV[0])
puts formatter