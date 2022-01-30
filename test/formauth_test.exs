defmodule FormAuthentication do
  # Import Helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start Session
  hound_session()

  test "Inputs proper auth creds into form and logs user into application" do
    # Arrange
    navigate_to("https://the-internet.herokuapp.com/login")
    usernameInput = find_element(:id, "username")
    passwordInput = find_element(:id, "password")
    submitButton = find_element(:class, "radius")
    # Act
    input_into_field(usernameInput, "tomsmith")
    input_into_field(passwordInput, "SuperSecretPassword!")
    click(submitButton)
    # Assert
    assert element_displayed?({:class, "subheader"}) == true
    assert visible_text({:class, "subheader"}) == "Welcome to the Secure Area. When you are done click logout below."
  end

  test "Uses log out button to log user out of the application" do
    # Arrange
    navigate_to("https://the-internet.herokuapp.com/login")
    usernameInput = find_element(:id, "username")
    passwordInput = find_element(:id, "password")
    submitButton = find_element(:class, "radius")
    # Act
    input_into_field(usernameInput, "tomsmith")
    input_into_field(passwordInput, "SuperSecretPassword!")
    click(submitButton)
    # Assert
    assert element_displayed?({:class, "radius"}) == true
    click({:class, "radius"})
    assert element_displayed?({:id, "login"}) == true
  end

  test "Inputs improper username auth creds into form and should not be logged into application" do
    # Arrange
    navigate_to("https://the-internet.herokuapp.com/login")
    usernameInput = find_element(:id, "username")
    passwordInput = find_element(:id, "password")
    submitButton = find_element(:class, "radius")
    # Act
    input_into_field(usernameInput, "ﾟ･✿ヾ╲(｡◕‿◕｡)╱✿･ﾟ")
    input_into_field(passwordInput, "SuperSecretPassword!")
    click(submitButton)
    # Assert
    assert element_displayed?({:class, "error"}) == true
  end

  test "Inputs improper password auth creds into form and should not be logged into application" do
    # Arrange
    navigate_to("https://the-internet.herokuapp.com/login")
    usernameInput = find_element(:id, "username")
    passwordInput = find_element(:id, "password")
    submitButton = find_element(:class, "radius")
    # Act
    input_into_field(usernameInput, "tomsmith")
    input_into_field(passwordInput, "Ｔｈｅ ｑｕｉｃｋ ｂｒｏｗｎ ｆｏｘ ｊｕｍｐｓ ｏｖｅｒ ｔｈｅ ｌａｚｙ ｄｏｇ")
    click(submitButton)
    # Assert
    assert element_displayed?({:class, "error"}) == true
  end
end
