defmodule EntryAd do
  # Import Helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start Session
  hound_session()

  @moduletag :entry_ad_tests

  test "Ad should appear on intial page load" do
    # Arrange
    navigate_to("https://the-internet.herokuapp.com/entry_ad")
    # Act
    :timer.sleep(1000)
    # Assert
    assert element_displayed?({:id, "modal"}) == true
  end

  test "User closes ad and should not reappear on reload" do
    # Arrange
    navigate_to("https://the-internet.herokuapp.com/entry_ad")
    # Act
    :timer.sleep(1000)
    click({:xpath, "//*[@id='modal']/div[2]/div[3]/p"})
    refresh_page()
    # Assert
    assert element_displayed?({:id, "modal"}) == false
  end

  # Failing test
  test "User reactivates ad by clicking enable link after ad has been closed" do
    # Arrange
    navigate_to("https://the-internet.herokuapp.com/entry_ad")
    # Act
    :timer.sleep(1000)
    click({:xpath, "//*[@id='modal']/div[2]/div[3]/p"})
    click({:id, "restart-ad"})
    refresh_page()
    # Assert
    try do
      assert element_displayed?({:id, "modal"}) == true
    rescue
      e ->
        take_screenshot("test/screenshots/entryad-reenablead-error.png")
      raise e
    end
  end
end
