require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Tucker") }
  let(:choco_chip_cookie) { Dessert.new("choco_chip_cookie", 12, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(choco_chip_cookie.type).to eq("choco_chip_cookie")
    end

    it "sets a quantity" do
      expect(choco_chip_cookie.quantity).to eq(12)
    end

    it "starts ingredients as an empty array" do
      expect(choco_chip_cookie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("apple_pie", "many", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      choco_chip_cookie.add_ingredient("chocolate_chips")
      expect(choco_chip_cookie.ingredients).to include("chocolate_chips")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["chocolate_chips", "sugar", "butter", "egg", "flour"]

      ingredients.each do |ingredient|
        choco_chip_cookie.add_ingredient(ingredient)
      end

      expect(choco_chip_cookie.ingredients).to eq(ingredients)
      choco_chip_cookie.mix!
      expect(choco_chip_cookie.ingredients).not_to eq(ingredients)
      expect(choco_chip_cookie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      choco_chip_cookie.eat(6)
      expect(choco_chip_cookie.quantity).to eq(6)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { choco_chip_cookie.eat(15)}.to raise_error("didn't make enough!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Angela the finest")
      expect(choco_chip_cookie.serve).to eq("Chef Angela the finest has made 12 chocolate_chip_cookies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(choco_chip_cookie)
      choco_chip_cookie.make_more
    end
  end
end
