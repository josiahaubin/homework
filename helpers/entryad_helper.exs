defmodule EntryAdHelper do
  # Import Helpers
  use Hound.Helpers
  use ExUnit.Case

  def navigate_to_url do
    navigate_to("https://the-internet.herokuapp.com/entry_ad")
  end

  def close_modal do
    click({:xpath, "//*[@id='modal']/div[2]/div[3]/p"})
  end

  def restart_modal do
    click({:id, "restart-ad"})
  end
end
