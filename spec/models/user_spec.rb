require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'has valid inputs' do
      it 'succesfully saves if given valid inputs' do
        user = User.new(first_name:'Scott', last_name:'G', email:'test1t@example.com', password:'1234567', password_confirmation:'1234567')
        expect(user).to be_valid
      end

      it 'Throws error if password and password confirmation dont match' do
        user = User.new(first_name:'Scott', last_name:'G', email:'test@example.com', password:'1234567', password_confirmation:'321')
        user.save
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    

      it 'Throws error if email is not unique' do
        user = User.new(first_name:'Scott', last_name:'G', email:'test@example.com', password:'1234567', password_confirmation:'1234567')
        user.save


        user1 = User.new(first_name:'Test', last_name:'G', email:'test@example.com', password:'1234567', password_confirmation:'1234567')
        user1.save

        expect(user1.errors.full_messages).to include("Email has already been taken")
      end


      it 'Throws error if password is too short' do
        user = User.new(first_name:'Scott', last_name:'G', email:'test@example.com', password:'123', password_confirmation:'1234567')
        user.save

        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end


     

 
    end
  end

  describe 'Validations' do
    context 'has valid inputs' do
      it 'succesfully saves if given valid inputs' do
        user = User.new(first_name:'Scott', last_name:'G', email:'test@example.com', password:'1234567', password_confirmation:'1234567')
        user.save
        expect(User.authenticate_with_credentials('test@example.com', '1234567')[0]).to eq(User.find_by(first_name:'Scott'))
      end
    end
  end

end
