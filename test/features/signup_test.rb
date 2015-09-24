require "test_helper"

class SignupTest < Capybara::Rails::TestCase

  test "Can signup a user" do
    visit root_path
    click_link "Sign Up"

    fill_in "Email", with: "theemail@example.com"
    fill_in "Password", with: "12345678"
    fill_in "Password Confirmation", with: "12345678"
    click_button "Sign Up"

    assert_content page, "#thesecret"


  end

end
