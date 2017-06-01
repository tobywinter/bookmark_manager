# As a user
# So I can search links easily
# I want to add tags to links

feature 'Adding tags to links' do
  scenario 'Add a tag to a link' do
    visit '/links/new'
    fill_in 'url', with: "http://www.google.co.uk/"
    fill_in 'title', with: 'Google'
    fill_in 'tag', with: 'Search Engine'
    click_button 'Save Link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Search Engine')
    end
  end
end
