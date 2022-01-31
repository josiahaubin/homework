defmodule FormAuthHelper do
  # Import Helpers
  use Hound.Helpers
  use ExUnit.Case

  def get_username do
    find_element(:id, "username")
  end

  def get_password do
    find_element(:id, "password")
  end

  def get_submit_button do
    find_element(:class, "radius")
  end

  def navigate_to_url do
    navigate_to("https://the-internet.herokuapp.com/login")
  end

  def valid_input(usernameInput, passwordInput) do
    input_into_field(usernameInput, "tomsmith")
    input_into_field(passwordInput, "SuperSecretPassword!")
  end

  def invalid_username(usernameInput, passwordInput) do
    input_into_field(usernameInput, "ﾟ･✿ヾ╲(｡◕‿◕｡)╱✿･ﾟ")
    input_into_field(passwordInput, "SuperSecretPassword!")
  end

  def invalid_password(usernameInput, passwordInput) do
    input_into_field(usernameInput, "tomsmith")
    input_into_field(passwordInput, "Ｔｈｅ ｑｕｉｃｋ ｂｒｏｗｎ ｆｏｘ ｊｕｍｐｓ ｏｖｅｒ ｔｈｅ ｌａｚｙ ｄｏｇ")
  end
end
