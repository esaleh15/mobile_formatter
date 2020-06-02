require 'spec_helper'
require 'pry'
require 'formatter/phone_number/uk'

describe Formatter::PhoneNumber::UK do

	let(:formatter) { Formatter::PhoneNumber::UK }

	describe 'Verifing Spaces' do

		context 'when number has one space' do

			let (:number) {'+447321 890230'}

			it 'should remove and join together' do

				f = formatter.remove_space(number)
				expect(f).to eq('+447321890230')
			end
		end

		context 'when number has multiple spaces' do

			let (:number) {'+4473 21 8902 30'}

			it 'should remove and join together' do

				f = formatter.remove_space(number)
				expect(f).to eq('+447321890230')
			end
		end

		context 'when number has no spaces' do

			let (:number) {'+447321890230'}

			it 'should return the original number' do

				f = formatter.remove_space(number)
				expect(f).to eq('+447321890230')
			end
		end
	end

	describe 'Validity' do

		context 'when number starts with correct prefix' do

			let (:number1) {'+4473218900'}
			let (:number2) {'44732189020'}
			let (:number3) {'07321890230'}

			it 'should return the original number' do
				no1 = formatter.is_valid(number1)
				no2 = formatter.is_valid(number2)
				no3 = formatter.is_valid(number3)
				expect(no1).to eq('+4473218900')
				expect(no2).to eq('44732189020')
				expect(no3).to eq('07321890230')
			end
		end

		
		context 'when number does not start with correct prefix' do

			let (:number1) {'06321890230'}
			let (:number2) {'+17321890230'}
			let (:number3) {'+92151890230'}

			it 'should return the original number' do
				expect {formatter.is_valid(number1)}.to raise_error(BadFormatError, "Invalid UK Number Format")
				expect {formatter.is_valid(number2)}.to raise_error(BadFormatError, "Invalid UK Number Format")
				expect {formatter.is_valid(number3)}.to raise_error(BadFormatError, "Invalid UK Number Format")
			end
		end

		context 'when number is not the correct UK length' do

			let (:number1) {'44732189023023762'}

			it 'should return the original number' do
				expect {formatter.is_valid(number1)}.to raise_error(BadFormatError, "Invalid UK Number Length")
			end
		end		
	end

	describe 'Output' do

		context 'to correct format' do

			let (:number1) {'07321890202'}
			let (:number2) {'+447321890202'}

			it 'should append correct prefix' do
				no1 = formatter.formatted_number(number1)
				no2 = formatter.formatted_number(number2)
				expect(no1).to eq('+447321890202')
				expect(no2).to eq('+447321890202')
			end
		end
	end

	describe 'End to end Format' do

		context 'When valid' do 

			let(:number) {'07321890202'}

			it 'should change the prefix and return correct format' do
				no1 = formatter.format(number)
				expect(no1).to eq('+447321890202')
			end
		end

		context 'When invalid' do

			let(:number) {'06321890202'}
			let(:number2) {'0783173492384'}

			it 'should raise an #Invalid UK Number Format error' do
				expect {formatter.format(number)}.to raise_error(BadFormatError, "Invalid UK Number Format")
			end

			it 'should raise an #Invalid UK Number Length error' do
				expect {formatter.format(number2)}.to raise_error(BadFormatError, "Invalid UK Number Length")
			end
		end
	end
end