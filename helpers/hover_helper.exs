defmodule HoverHelper do
  # Import Helpers
  use Hound.Helpers
  use ExUnit.Case

  def navigate_to_url do
    navigate_to("https://the-internet.herokuapp.com/hovers")
  end

  def move_to_first_img do
    move_to({:xpath, "//*[@id='content']/div/div[1]/img"}, 10, 10)
  end

  def move_to_second_img do
    move_to({:xpath, "//*[@id='content']/div/div[2]/img"}, 10, 10)
  end

  def click_profile_link do
    click({:xpath, "//*[@id='content']/div/div[2]/div/a"})
  end
end
