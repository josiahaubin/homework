Code.require_file("helpers/entryad_helper.exs")

defmodule EntryAd do
  # Import Helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start Session
  hound_session()

  @moduletag :entry_ad_tests

  test "Ad should appear on intial page load" do
    # Arrange
    EntryAdHelper.navigate_to_url
    # Act
    :timer.sleep(1000)
    # Assert
    try do
      assert element_displayed?({:id, "modal"}) == true
    rescue
      e ->
        take_screenshot("test/screenshots/entryad-intialpageload-error.png")
      raise e
    end
  end

  test "User closes ad and should not reappear on reload" do
    # Arrange
    EntryAdHelper.navigate_to_url
    # Act
    :timer.sleep(1000)
    EntryAdHelper.close_modal
    refresh_page()
    # Assert
    try do
      assert element_displayed?({:id, "modal"}) == false
    rescue
      e ->
        take_screenshot("test/screenshots/entryad-closead-error.png")
      raise e
    end
  end

  # Failing test
  test "User reactivates ad by clicking enable link after ad has been closed" do
    # Arrange
    EntryAdHelper.navigate_to_url
    # Act
    :timer.sleep(1000)
    EntryAdHelper.close_modal
    EntryAdHelper.restart_modal
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
