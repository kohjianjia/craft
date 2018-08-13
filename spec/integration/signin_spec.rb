require 'rails_helper'
require 'byebug'

# descriptive acceptance tests
describe "the signin process", type: :feature do
  before :each do
    User.create(username: 'hello1', password: 'uiop7890', email:'hello1@email.com')
  end

  it "signs me in" do
    visit '/sign_in'

      fill_in 'username', with: 'hello1'
      fill_in 'password', with: 'uiop7890'

    click_button 'Sign In'
    expect(page).to have_content 'Welcome back'
  end
end

