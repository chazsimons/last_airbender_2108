# As a user,
# When I visit "/"
# And I Select "Fire Nation" from the select field
# (Note: Use the existing select field)
# And I click "Search For Members"
# Then I should be on page "/search"
# Then I should see the total number of people who live in the Fire Nation. (should be close to 100)
# And I should see a list with the detailed information for the first 25 members of the Fire Nation.
#
# And for each of the members I should see:
# - The name of the member (and their photo, if they have one)
# - The list of allies or "None"
# - The list of enemies or "None"
# - Any affiliations that the member has
require 'rails_helper'

RSpec.describe 'Search Index' do
  it 'returns the results of a search by nation' do
    visit '/'
    select 'Fire Nation', from: :nation
    click_button "Search For Members"

    expect(current_path).to eq("/search")
    expect(page).to have_content("Members of the Fire Nation")
  end

  it 'gives a count of total population' do
    visit '/'
    select 'Fire Nation', from: :nation
    click_button "Search For Members"
    save_and_open_page
    expect(current_path).to eq("/search")
    expect(page).to have_content("Total Population:")
  end
end
