require 'rails_helper'

RSpec.describe Calculator do	
  describe "#add" do
    it "returns 0 for an empty string" do
      expect(Calculator.new.add("")).to eq(0)
    end

    it "returns the number itself for a single number string" do
      expect(Calculator.new.add("1")).to eq(1)
    end

    it "returns the sum of two numbers" do
      expect(Calculator.new.add("1,5")).to eq(6)
    end

    it "returns the sum of multiple numbers" do
      expect(Calculator.new.add("1,5,4,5")).to eq(15)
    end

    it "handles new lines between numbers" do
      expect(Calculator.new.add("1\n2,3")).to eq(6)
    end

    it "supports a custom delimiter" do
      expect(Calculator.new.add("//;\n1;2")).to eq(3)
    end

    it "supports a different custom delimiter" do
      expect(Calculator.new.add("//|\n1|2|3")).to eq(6)
    end

    it "raises an exception for a single negative number" do
      expect { Calculator.new.add("1,-2,3") }.to raise_error(RuntimeError, "negative numbers not allowed -2")
    end

    it "raises an exception for multiple negative numbers" do
      expect { Calculator.new.add("1,-2,-5,3") }.to raise_error(RuntimeError, "negative numbers not allowed -2, -5")
    end

    it "ignores numbers greater than 1000" do
      expect(Calculator.new.add("2,1001")).to eq(2)
    end

    it "supports multi-character delimiters" do
      expect(Calculator.new.add("//[***]\n1***2***3")).to eq(6)
    end


  end

  it "subtracts two numbers" do
    expect(Calculator.new.subtract(5, 3)).to eq(2)
  end

  it "multiply two numbers" do
    expect(Calculator.new.multiply(4, 3)).to eq(12)
  end

  it "divide two numbers" do
    expect(Calculator.new.divide(10, 5)).to eq(2)
  end

  it "raises an error when dividing by zero" do
    expect { Calculator.new.divide(10, 0) }.to raise_error(ZeroDivisionError, "Cannot divide by zero")
  end
end