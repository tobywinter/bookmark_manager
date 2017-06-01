# As a User
# So I can search for specific topics
# I want to filter links by a tag

feature 'filter links by tag' do
  before(:each) do
    Link.create(url: 'www.bbc.co.uk', title: 'BBC', tags: [Tag.first_or_create(name: 'News')])
    Link.create(url: 'www.ebaumsworld.com', title: 'EbaumsWorld', tags: [Tag.first_or_create(name: 'Stoopid')])
    Link.create(url: 'www.bubblebobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'Bubbles')])
    Link.create(url: 'www.bubbletrouble.co.uk', title: 'Bubble Trouble', tags: [Tag.first_or_create(name: 'Bubbles')])
  end
  scenario 'filter links by a single tag' do
    visit('/tags/Bubbles')
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).not_to have_content('BBC')
      expect(page).not_to have_content('EbaumsWorld')
      expect(page).to have_content('Bubble Bobble')
      expect(page).to have_content('Bubble Trouble')
    end
  end
end
