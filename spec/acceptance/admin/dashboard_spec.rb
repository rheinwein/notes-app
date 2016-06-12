require 'rails_helper'

RSpec.feature 'Admin Dashboard' do
  let(:admin) { create(:user, name: 'Admin User', password: 'password', admin: true) }
  let(:not_admin) { create(:user, name: 'Admin User', admin: false) }

  before(:each) do
    visit login_path
    fill_in 'Password', with: 'password'
    click 'Log in'
    visit admin_users_path
  end

  def login_with_password(password)
    visit login_path
    fill_in 'Password', with: password
    click 'Log in'
  end
end
