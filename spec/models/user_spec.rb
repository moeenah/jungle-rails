require 'rails_helper'

RSpec.describe User, type: :model do
  before {@same_user = User.new(name: "Anything", email: 'anything@anything.com',
                      password: 'password', password_confirmation: 'password')}
  subject {
      described_class.new(name: "Anything", email: 'anything@anything.com',
                      password: 'password12', password_confirmation: 'password12')
    }
  describe 'Validations' do
    it "is not valid if password is different from password_confirmation" do
      subject.password_confirmation = 'pas'
      # expect(subject.password_confirmation).not_to eql(subject.password)
      expect(subject).to_not be_valid
    end
    it "is not valid without a password and a password_confirmation" do
      subject.password = nil
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end
    it "is not valid if email is already used regardless of case" do
      @same_user.save
      expect(subject).to_not be_valid
    end
    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it "is valid if password length is greater than 8 chars" do
      expect(subject).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "is valid for email entered with whitespace" do
      subject.save!
      newUser = (subject).authenticate_with_credentials('   anything@anything.com   ', 'password12')
      expect(newUser).to be true
    end
    it "is case insensitive for email entered" do
      subject.save!
      newUser = (subject).authenticate_with_credentials('   aNYThing@AnyTHIng.coM   ', 'password12')
      expect(newUser).to be true
    end
  end

end
