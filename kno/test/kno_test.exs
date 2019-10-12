defmodule KnoTest do
  use ExUnit.Case
  doctest Kno

  test "greets the world" do
    assert Kno.hello() == :world
  end
end
