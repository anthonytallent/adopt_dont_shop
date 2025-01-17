require 'rails_helper' 

RSpec.describe 'applications new' do
  it 'can create a new application' do
    visit '/applications/new'

    fill_in('name', with: "The Dude")
    fill_in('street_address', with: "323 Place St")
    fill_in('city', with: "Denver")
    fill_in('state', with: "CO")
    fill_in('zip_code', with: "78453")
    fill_in('description', with: "That's like your opinion, man")

    click_button "Submit"

    expect(page).to have_content("The Dude")
    expect(page).to have_content("323 Place St")
    expect(page).to have_content("Denver")
    expect(page).to have_content("CO")
    expect(page).to have_content("78453")
    expect(page).to have_content("That's like your opinion, man")
    expect(page).to have_content("in progress")
  end

  it 'will return a list of error messages if any part of the form is left unfilled' do
    visit '/applications/new'
    
    click_button "Submit"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Street address can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("State can't be blank")
    expect(page).to have_content("Zip code can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end