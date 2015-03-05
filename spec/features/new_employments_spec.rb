require 'rails_helper'

feature 'New Employments' do

  scenario 'User can create a new employment' do
    visit employments_path
    expect(page).to have_content('Employments')
    click_on 'New Employment'

    expect(page).to have_content('New Employment')
  end
end
