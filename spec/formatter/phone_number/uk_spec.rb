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

		describe 'Validity' do
			context 'Output' do

			end
		end
	end
end