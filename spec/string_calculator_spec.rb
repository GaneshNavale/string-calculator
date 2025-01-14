# frozen_string_literal: true
require 'rspec'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end

    context 'when the input is a single number' do
      it 'returns 0 when the string contains 0' do
        expect(StringCalculator.add('0')).to eq(0)
      end

      it 'returns 32 when the string contains 32' do
        expect(StringCalculator.add('32')).to eq(32)
      end

      it 'returns 9999 when the string contains 9999' do
        expect(StringCalculator.add('9999')).to eq(9999)
      end
    end
  end
end
