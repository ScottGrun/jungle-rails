require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'has valid inputs' do
      it 'succesfully saves if given valid inputs' do
        user = User.new(first_name:'Scott', last_name:'G', email:'test@example.com', password:'123', password_confirmation:'123')
        expect(user).to be_valid
      end

      it 'Throws error if password and password confirmation dont match' do
        user = User.new(first_name:'Scott', last_name:'G', email:'test@example.com', password:'123', password_confirmation:'321')
        user.save
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    

      it 'Throws error if email is not unique' do
        user = User.new(first_name:'Scott', last_name:'G', email:'test@example.com', password:'123', password_confirmation:'123')
        user.save


        user1 = User.new(first_name:'Test', last_name:'G', email:'test@example.com', password:'123', password_confirmation:'123')
        user1.save

        expect(user1.errors.full_messages).to include("Email has already been taken")
      end

 
    end
  end
end
