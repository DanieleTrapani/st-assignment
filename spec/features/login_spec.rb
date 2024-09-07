require 'rails_helper'

RSpec.describe 'the signin process', type: :feature do
  before(:each) do
    User.create(email: 'user@example.com', password: 'password', first_name: 'John', last_name: 'Doe', role: 'employee')
  end

  it 'signs me in' do
    visit('/')
    within('#new_user') do
      fill_in('Email', with: 'user@example.com')
      fill_in('Password', with: 'password')
    end

    click_button('Sign In')
    expect(page).to(have_content('New Entry'))
  end

  it 'does not sign me in' do
    visit('/')
    within('#new_user') do
      fill_in('Email', with: 'notauser@example.com')
      fill_in('Password', with: 'password1')
    end

    click_button('Sign In')
    expect(page).to(have_content('Sign In'))
  end
end
