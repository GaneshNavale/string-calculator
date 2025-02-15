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

      it 'returns 1000 when the string contains 1000' do
        expect(StringCalculator.add('1000')).to eq(1000)
      end
    end

    context 'when there are multiple numbers' do
      it 'returns 3 when the string contains 1 and 2' do
        expect(StringCalculator.add('1,2')).to eq(3)
      end

      it 'returns 10 when the string contains 4 and 6' do
        expect(StringCalculator.add('4,6')).to eq(10)
      end

      it 'returns 15 when the string contains 1, 2, 3, 4, and 5' do
        expect(StringCalculator.add('1,2,3,4,5')).to eq(15)
      end
    end

    context 'when there is new line between numbers' do
      it 'returns 6 when the string contains 1\n2,3' do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end

      it 'returns 6 when the string contains 1\n2\n3' do
        expect(StringCalculator.add("1\n2\n3")).to eq(6)
      end

      it 'returns 15 when the string contains 1,2\n3,4,5' do
        expect(StringCalculator.add("1,2\n3,4,5")).to eq(15)
      end
    end

    context 'when there is a custom delimiter' do
      it 'returns 3 when the string contains //;\n1;2' do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end

      it 'returns 6 when the string contains //;\n1;2\n3' do
        expect(StringCalculator.add("//;\n1;2\n3")).to eq(6)
      end

      it 'returns 6 when the string contains //:\n1:2:3' do
        expect(StringCalculator.add("//:\n1:2:3")).to eq(6)
      end

      it 'returns 6 when the string contains //:\n1:2\n3' do
        expect(StringCalculator.add("//:\n1:2\n3")).to eq(6)
      end
    end

    context 'when there are negative numbers' do
      it 'raises an exception when the string contains -1' do
        expect { StringCalculator.add('-1') }.to raise_error('negatives not allowed: -1')
      end

      it 'raises an exception when the string contains -1, 2, -3' do
        expect { StringCalculator.add('-1,2,-3') }.to raise_error('negatives not allowed: -1, -3')
      end
    end

    it 'ignores numbers greater than 1000' do
      expect(StringCalculator.add('1001,2')).to eq(2)
    end

    context 'when there is a custom delimiter of any length' do
      context 'when single delimiter' do
        it "returns 6 when the string contains //[***]\n1***2***3" do
          expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
        end
      end

      context 'when multiple delimiters' do
        it "returns 6 when the string contains //[*][%]\n1*2%3" do
          expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
        end

        it 'returns 12 when the string contains //[**][%%]\n3**4%%5' do
          expect(StringCalculator.add("//[**][%%]\n3**4%%5")).to eq(12)
        end

        it 'returns 6 when the string contains //[**][%%][!!]\n1**2%%3!!4' do
          expect(StringCalculator.add("//[**][%%][!!]\n1**2%%3!! 4")).to eq(10)
        end
      end
    end
  end
end
