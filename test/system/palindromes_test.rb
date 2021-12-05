require "application_system_test_case"

class PalindromesTest < ApplicationSystemTestCase
  setup do
    @palindrome = palindromes(:one)
  end

  test "visiting the index" do
    visit palindromes_url
    assert_selector "h1", text: "Palindromes"
  end

  test "creating a Palindrome" do
    visit palindromes_url
    click_on "New Palindrome"

    fill_in "Input", with: @palindrome.input
    fill_in "Output", with: @palindrome.output
    click_on "Create Palindrome"

    assert_text "Palindrome was successfully created"
    click_on "Back"
  end

  test "updating a Palindrome" do
    visit palindromes_url
    click_on "Edit", match: :first

    fill_in "Input", with: @palindrome.input
    fill_in "Output", with: @palindrome.output
    click_on "Update Palindrome"

    assert_text "Palindrome was successfully updated"
    click_on "Back"
  end

  test "destroying a Palindrome" do
    visit palindromes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Palindrome was successfully destroyed"
  end
end
