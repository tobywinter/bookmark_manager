# As a User
# So I can save links for later
# I want to add links to the list

feature 'I want to save links to the list' do
  scenario 'use a form to save a link to the list' do
    visit('/links/new')
    fill_in 'url', with: "http://www.google.co.uk/"
    fill_in 'title', with: 'This is Google'
    click_button 'Save Link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('This is Google')
    end
  end
end
