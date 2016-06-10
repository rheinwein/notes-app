require 'rails_helper'

RSpec.feature 'Admin Users' do
  let(:admin) { create(:user, name: 'Admin User', admin: true) }
  let(:not_admin) { create(:user, name: 'Admin User', admin: false) }


end