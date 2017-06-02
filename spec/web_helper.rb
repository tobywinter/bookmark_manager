def sign_up
  visit '/users/signup'
  fill_in 'email', with: "toby@iamlame.com"
  fill_in 'password', with: "z0mbocom"
  click_button 'Submit'
end
