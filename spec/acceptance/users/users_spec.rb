require 'rails_helper'

RSpec.feature 'User sessions' do
  before(:each) do
    visit login_path
  end

  context 'creating a new session' do
    it 'shows a welcome message to the new user' do
      fill_in 'user_name', with: 'Moby Dock'
      click_on 'Log in'
      expect(page).to have_text('Hello Moby Dock.')
    end

    it 'displays the issues page after a successful new sessions' do
      fill_in 'user_name', with: 'Test User'
      click_on 'Log in'
      expect(page).to have_current_path('/issues')
    end
  end

  context 'ending a session' do
    it 'logs out the current user' do
      fill_in 'user_name', with: 'Test User'
      click_on 'Log in'
      find(".navbar-link[href='/logout']").click()
      expect(page).to have_current_path('/login')
      expect(page).to have_text('Successfully logged out.')
    end
  end
end
