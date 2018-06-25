require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before {@category = Category.new(name: 'testCat')}
    subject {
      described_class.new(name: "Anything", price_cents: 1000,
                      quantity: 22, category_id: @category.id)
    }

    # validation tests/examples here
    it "is valid with valid attributes" do
      @category.save!
      expect(subject).to be_valid
    end
    it "is not valid without a name" do
      @category.save!
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a price" do
      @category.save!
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a quantity" do
      @category.save!
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a category" do
      @category.save!
      subject.category_id = nil
      expect(subject).to_not be_valid
    end
  end
end