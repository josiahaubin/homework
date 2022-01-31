Code.require_file("helpers/formauth_helper.exs")

defmodule FormAuthentication do
  # Import Helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start Session
  hound_session()

  @moduletag :form_auth_tests

  test "Inputs proper auth creds into form and logs user into application" do
    # Arrange
    FormAuthHelper.navigate_to_url
    usernameInput = FormAuthHelper.get_username
    passwordInput = FormAuthHelper.get_password
    submitButton = FormAuthHelper.get_submit_button
    # Act
    FormAuthHelper.valid_input(usernameInput, passwordInput)
    click(submitButton)
    # Assert
    assert element_displayed?({:class, "subheader"}) == true
    assert visible_text({:class, "subheader"}) == "Welcome to the Secure Area. When you are done click logout below."
  end

  test "Uses log out button to log user out of the application" do
    # Arrange
    FormAuthHelper.navigate_to_url
    usernameInput = FormAuthHelper.get_username
    passwordInput = FormAuthHelper.get_password
    submitButton = FormAuthHelper.get_submit_button
    # Act
    FormAuthHelper.valid_input(usernameInput, passwordInput)
    click(submitButton)
    # Assert
    assert element_displayed?({:class, "radius"}) == true
    click({:class, "radius"})
    assert element_displayed?({:id, "login"}) == true
  end

  test "Inputs improper username auth creds into form and should not be logged into application" do
    # Arrange
    FormAuthHelper.navigate_to_url
    usernameInput = FormAuthHelper.get_username
    passwordInput = FormAuthHelper.get_password
    submitButton = FormAuthHelper.get_submit_button
    # Act
    FormAuthHelper.invalid_username(usernameInput, passwordInput)
    click(submitButton)
    # Assert
    assert element_displayed?({:class, "error"}) == true
  end

  test "Inputs improper password auth creds into form and should not be logged into application" do
    # Arrange
    FormAuthHelper.navigate_to_url
    usernameInput = FormAuthHelper.get_username
    passwordInput = FormAuthHelper.get_password
    submitButton = FormAuthHelper.get_submit_button
    # Act
    FormAuthHelper.invalid_password(usernameInput, passwordInput)
    click(submitButton)
    # Assert
    assert element_displayed?({:class, "error"}) == true
  end
end
