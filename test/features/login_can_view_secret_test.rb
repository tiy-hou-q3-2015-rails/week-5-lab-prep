require "test_helper"

class LoginCanViewSecretTest < Capybara::Rails::TestCase

  test "Can sign out" do

    me = User.create email: "jesse@example.com", password: "12345678"

    visit root_path

    fill_in "Email", with: "jesse@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "#thesecret"

    click_link "Sign Out"

    refute_content page, "#thesecret"

  end

  test "Cannot view secret when not logged in" do
    me = User.create email: "jesse@example.com", password: "12345678"

    visit root_path
    refute_content page, "#thesecret"

  end

  test "Can view secret after sign in" do

    me = User.create email: "jesse@example.com", password: "12345678"

    visit root_path

    fill_in "Email", with: "jesse@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "#thesecret"


  end
end
