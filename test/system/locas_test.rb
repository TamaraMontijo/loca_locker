require "application_system_test_case"

class LocasTest < ApplicationSystemTestCase
  setup do
    @loca = locas(:one)
  end

  test "visiting the index" do
    visit locas_url
    assert_selector "h1", text: "Locas"
  end

  test "creating a Loca" do
    visit locas_url
    click_on "New Loca"

    fill_in "Address", with: @loca.address
    fill_in "Name", with: @loca.name
    click_on "Create Loca"

    assert_text "Loca was successfully created"
    click_on "Back"
  end

  test "updating a Loca" do
    visit locas_url
    click_on "Edit", match: :first

    fill_in "Address", with: @loca.address
    fill_in "Name", with: @loca.name
    click_on "Update Loca"

    assert_text "Loca was successfully updated"
    click_on "Back"
  end

  test "destroying a Loca" do
    visit locas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loca was successfully destroyed"
  end
end
