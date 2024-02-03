require "rails_helper"

RSpec.feature "Logout", type: :feature do
  let(:user) { create(:user) }

  scenario 'user successfully logs out' do

    # Login
    sign_in user
    visit root_path

    # Logout
    find('nav #user-settings').click
    within('li.dropdown.pc-menu') do
      # Click the "Log out" link
      find('ul.dropdown-menu li a', text: 'Log out').click
    end

    expect(page).to have_selector('nav a', text: 'Login')
  end
end
