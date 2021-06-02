require "application_system_test_case"

class ExplorersTest < ApplicationSystemTestCase
  setup do
    @explorer = explorers(:one)
  end

  test "visiting the index" do
    visit explorers_url
    assert_selector "h1", text: "Explorers"
  end

  test "creating an Explorer" do
    visit explorers_url
    click_on "New Explorer"

    fill_in "Email", with: @explorer.email
    fill_in "First name", with: @explorer.first_name
    fill_in "Last name", with: @explorer.last_name
    fill_in "Phone", with: @explorer.phone
    fill_in "Twitter", with: @explorer.twitter
    click_on "Create Explorer"

    assert_text "An Explorer was successfully created"
    click_on "Back"
  end

  test "updating an Explorer" do
    visit explorers_url
    click_on "Edit", match: :first

    fill_in "Email", with: @explorer.email
    fill_in "First name", with: @explorer.first_name
    fill_in "Last name", with: @explorer.last_name
    fill_in "Phone", with: @explorer.phone
    fill_in "Twitter", with: @explorer.twitter
    click_on "Update Explorer"

    assert_text "Explorer was successfully updated"
    click_on "Back"
  end

  test "destroying an Explorer" do
    visit explorers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "An explorer was successfully destroyed"
  end
end
