require "test_helper"

class PalindromesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @palindrome = palindromes(:one)
  end

  test "should get index" do
    get palindromes_url
    assert_response :success
  end

  test "should get new" do
    get new_palindrome_url
    assert_response :success
  end

  test "should create palindrome" do
    assert_difference('Palindrome.count') do
      post palindromes_url, params: { palindrome: { input: @palindrome.input, output: @palindrome.output } }
    end

    assert_redirected_to palindrome_url(Palindrome.last)
  end

  test "should show palindrome" do
    get palindrome_url(@palindrome)
    assert_response :success
  end

  test "should get edit" do
    get edit_palindrome_url(@palindrome)
    assert_response :success
  end

  test "should update palindrome" do
    patch palindrome_url(@palindrome), params: { palindrome: { input: @palindrome.input, output: @palindrome.output } }
    assert_redirected_to palindrome_url(@palindrome)
  end

  test "should destroy palindrome" do
    assert_difference('Palindrome.count', -1) do
      delete palindrome_url(@palindrome)
    end

    assert_redirected_to palindromes_url
  end
end
