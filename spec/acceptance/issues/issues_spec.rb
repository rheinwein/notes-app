require 'rails_helper'

RSpec.feature 'Issues' do
  before(:each) do
    visit login_path
    fill_in 'user_name', with: 'Moby Dock'
    click_on 'Log in'
  end

  context 'creating an issue' do
    it 'creates a new issue via form' do
      fill_in 'issue_text', with: 'Clean the kitchen'
      click_on('Do this thing!')
      expect(page).to have_current_path('/issues')
      expect(page).to have_text('Clean the kitchen')
    end
  end
end
