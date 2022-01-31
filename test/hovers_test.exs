defmodule Hovers do
  # Import Helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start Session
  hound_session()

  @moduletag :hover_tests

  test "User hovers first image and can view name of the first image" do
    # Arrange
    navigate_to("https://the-internet.herokuapp.com/hovers")
    # Act
    move_to({:xpath, "//*[@id='content']/div/div[1]/img"}, 10, 10)
    # Assert
    assert element_displayed?({:xpath, "//*[@id='content']/div/div[1]/div/h5"}) == true
    assert visible_text({:xpath, "//*[@id='content']/div/div[1]/div/h5"}) == "name: user1"
  end

  test "User hovers second image and is able to select link to view profile of second image" do
    # Arrange
    navigate_to("https://the-internet.herokuapp.com/hovers")
    # Act
    move_to({:xpath, "//*[@id='content']/div/div[2]/img"}, 10, 10)
    click({:xpath, "//*[@id='content']/div/div[2]/div/a"})
    # Assert
    profileUrl = current_url()
    assert profileUrl == "https://the-internet.herokuapp.com/users/2"
  end
end
