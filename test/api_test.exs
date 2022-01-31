defmodule API do
  use ExUnit.Case

  @moduletag :api_tests

  test "GET Get user by real user id" do
    resp = HTTPoison.get!("https://reqres.in/api/users/2")
    assert resp.status_code == 200
  end

  test "GET Get user by bad user id" do
    resp = HTTPoison.get!("https://reqres.in/api/users/-1")
    assert resp.status_code == 404
  end

  test "POST Create user" do
    body = %{name: "Arnold Schwarzenegger", job: "Professional Bodybuilder"} |> Poison.encode!()
    resp = HTTPoison.post!("https://reqres.in/api/users", body)
    assert resp.status_code == 201
  end

  test "POST Login Failed" do
    body = %{email: "arnie@lifts.com"} |> Poison.encode!()
    resp = HTTPoison.post!("https://reqres.in/api/login", body)
    assert resp.status_code == 400
  end
end
