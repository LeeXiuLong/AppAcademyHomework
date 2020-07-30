require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => "Chef chef the Great Baker") }
  subject(:dessert) {Dessert.new("cheesecake", 3, chef)}
  
  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cheesecake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(3)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "hat", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("cream cheese")
      expect(dessert.ingredients).to include("cream cheese")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("cream cheese")
      dessert.add_ingredient("egg whites")
      dessert.add_ingredient("whip cream")
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("sugar")
      old_array = dessert.ingredients.map {|ele| ele}
      dessert.mix!
      expect(dessert.ingredients).to_not eq(old_array)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(1)
      expect(dessert.quantity).to eq(2)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {dessert.eat(4)}.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include("Chef chef the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(dessert)
    end
  end
end
