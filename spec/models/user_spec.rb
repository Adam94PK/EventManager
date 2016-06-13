require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'when new' do
    let(:user) { User.new }
    it 'should include the :user_name' do
      expect(user).to have_attribute(:name)
    end

    it 'should include the :role' do
      expect(user).to have_attribute(:role)
    end

    it 'should include the :name' do
      expect(user).to have_attribute(:name)
    end

    it 'should include the :surname' do
      expect(user).to have_attribute(:surname)
    end

    it 'should include the :company_name' do
      expect(user).to have_attribute(:company_name)
    end

    it 'should include the :email' do
      expect(user).to have_attribute(:email)
    end

    it 'should include the :encrypted_password' do
      expect(user).to have_attribute(:encrypted_password)
    end

    it 'should include the :reset_password_token' do
      expect(user).to have_attribute(:reset_password_token)
    end

    it 'should include the :reset_password_sent_at' do
      expect(user).to have_attribute(:reset_password_sent_at)
    end

    it 'should include the :remember_created_at' do
      expect(user).to have_attribute(:remember_created_at)
    end

    it 'should include the :sign_in_count' do
      expect(user).to have_attribute(:sign_in_count)
    end

    it 'should include the :current_sign_in_at' do
      expect(user).to have_attribute(:current_sign_in_at)
    end

    it 'should include the :last_sign_in_at' do
      expect(user).to have_attribute(:last_sign_in_at)
    end

    it 'should include the :current_sign_in_ip' do
      expect(user).to have_attribute(:current_sign_in_ip)
    end

    it 'should include the :last_sign_in_ip' do
      expect(user).to have_attribute(:last_sign_in_ip)
    end  

    it 'should include the :confirmation_token' do
      expect(user).to have_attribute(:confirmation_token)
    end

    it 'should include the :confirmed_at' do
      expect(user).to have_attribute(:confirmed_at)
    end

    it 'should include the :confirmation_sent_at' do
      expect(user).to have_attribute(:confirmation_sent_at)
    end

    it 'should include the :unconfirmed_email' do
      expect(user).to have_attribute(:unconfirmed_email)
    end

    it 'should include the :avatar_file_name' do
      expect(user).to have_attribute(:avatar_file_name)
    end

    it 'should include the :avatar_content_type' do
      expect(user).to have_attribute(:avatar_content_type)
    end

    it 'should include the :avatar_file_size' do
      expect(user).to have_attribute(:avatar_file_size)
    end

    it 'should include the :avatar_updated_at' do
      expect(user).to have_attribute(:avatar_updated_at)
    end

    it 'should include the :description' do
      expect(user).to have_attribute(:description)
    end

    it 'should include the :profile_access' do
      expect(user).to have_attribute(:profile_access)
    end

    it 'should include the :banned' do
      expect(user).to have_attribute(:banned)
    end 

    it 'should default :email to ''' do
      expect(user.email).to eq('')
    end 

    it 'should default :encrypted_password to ''' do
      expect(user.encrypted_password).to eq('')
    end  

    it 'should default :sign_in_count to 0' do
      expect(user.sign_in_count).to eq(0)
    end  

    it 'should default :profile_access to false' do
      expect(user.profile_access).to eq(false)
    end  

    it 'should default :banned to false' do
      expect(user.banned).to eq(false)
    end
  end

end