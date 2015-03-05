require 'rails_helper'

feature 'New Employments' do

  scenario 'User can create a new employment' do

    person = Person.create!(
    first_name: "Firsty",
    last_name: "Lasty"
    )

    visit employments_path
    expect(page).to have_content('Employments')
    click_on 'New Employment'

    expect(page).to have_content('New Employment')
    select person.full_name, from: :employment_person_id

  end

  scenario 'User can create a new employment' do

    organization = Organization.create!(
    name: "gSchool"
    )

    visit employments_path
    expect(page).to have_content('Employments')
    click_on 'New Employment'

    expect(page).to have_content('New Employment')
    select organization.name, from: :employment_organization_id
    click_on 'Create Employment'

  end
end



# select organization.name, from: :employment_organization_id
# select job_title.name, from: :employment_job_title_id
# select location.name, from: :employment_location_id

# expect(page).to have_content(employment.name)
