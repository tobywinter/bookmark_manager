# As a user
# So that my information is private
# I want to have a user account with a password


feature 'users can create an account' do
  scenario 'user signs up for account with email and password' do
    visit '/users/signup'
    fill_in 'email', with: "toby@iamlame.com"
    fill_in 'password', with: "z0mbocom"
    click_button 'Submit'

    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome toby@iamlame.com'
    expect{User.count}.to change_by(1)
    expect(User.first.email).to eq('toby@iamlame.com')
  end
end
