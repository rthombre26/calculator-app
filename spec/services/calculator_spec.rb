require 'rails_helper'

RSpec.describe Calculator do
	describe "#add" do	
    it "adds two numbers" do
      calculator = Calculator.new
      result = calculator.add(2, 3)
      expect(result).to eq(5)
    end
  end
end