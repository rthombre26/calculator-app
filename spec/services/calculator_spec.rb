require 'rails_helper'

RSpec.describe Calculator do	
  it "adds two numbers" do
    calculator = Calculator.new
    result = calculator.add(2, 3)
    expect(result).to eq(5)
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