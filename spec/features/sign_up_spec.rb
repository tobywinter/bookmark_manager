# As a user
# So that my information is private
# I want to have a user account with a password


feature 'users can create an account' do

  scenario 'user signs up for account with email and password and requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users/signup'
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  def sign_up(email: 'toby@iamlame.com',
              password: 'z0mbocom',
              password_confirmation: 'z00mbbocom')
    visit '/users/signup'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Submit'
  end
end
