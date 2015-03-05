require 'rails_helper'

feature 'New Employments' do

  scenario 'User can select person' do

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

  scenario 'User can select a organization' do

    organization = Organization.create!(
    name: "gSchool"
    )

    visit employments_path
    expect(page).to have_content('Employments')
    click_on 'New Employment'

    expect(page).to have_content('New Employment')
    select organization.name, from: :employment_organization_id

  end
  scenario 'User can select a job title' do

    job_title = JobTitle.create!(
    name: "CEO"
    )

    visit employments_path
    expect(page).to have_content('Employments')
    click_on 'New Employment'

    expect(page).to have_content('New Employment')
    select job_title.name, from: :employment_job_title_id
  end

  scenario 'User can add a location' do

    location = Location.create!(
    name: "Omaha"
    )

    visit employments_path
    expect(page).to have_content('Employments')
    click_on 'New Employment'

    expect(page).to have_content('New Employment')
    select location.name, from: :employment_location_id
  end

  scenario 'User can select all and save' do

    person = Person.create!(
    first_name: "Firsty",
    last_name: "Lasty"
    )

    organization = Organization.create!(
    name: "gSchool"
    )

    job_title = JobTitle.create!(
    name: "CEO"
    )

    location = Location.create!(
    name: "Omaha"
    )

    visit employments_path
    expect(page).to have_content('Employments')
    click_on 'New Employment'

    expect(page).to have_content('New Employment')
    select person.full_name, from: :employment_person_id
    select organization.name, from: :employment_organization_id
    select job_title.name, from: :employment_job_title_id
    select location.name, from: :employment_location_id

    click_on 'Create Employment'

    expect(current_path).to eq(employments_path)

    expect(page).to have_content('Firsty Lasty')
    expect(page).to have_content('gSchool')
    expect(page).to have_content('CEO')
    expect(page).to have_content('Omaha')
  end

end
