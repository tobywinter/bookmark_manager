# As a user
# So I can search links easily
# I want to add tags to links

feature 'Adding tags to links' do
  scenario 'Add a tag to a link' do
    visit '/links/new'
    fill_in 'url', with: "http://www.google.co.uk/"
    fill_in 'title', with: 'Google'
    fill_in 'tags', with: 'Search Engine'

    click_button 'Save Link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('Search Engine')
  end

  scenario 'Adds multiple tags to a link' do
    visit '/links/new'
    fill_in 'url', with: "http://www.zombo.com/"
    fill_in 'title', with: 'Zombocom'
    fill_in 'tags', with: 'zombo, welcome'

    click_button 'Save Link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('zombo', 'welcome')
  end
end
