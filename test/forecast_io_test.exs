defmodule ForecastIOTest do
  use ExUnit.Case

  test "the result should be a decoded json object" do
    assert {:ok, result } = ForecastIO.forecast("28.6353,-106.0889")
    assert false = Enum.empty?(result)
  end

  test "result should have the current temperature" do
    {:ok, result } = ForecastIO.forecast("28.6353,-106.0889")
    current = ForecastIO.current(result)
    assert true = is_float current["temperature"]
  end

  test "should convert to celsius" do
    result = %{"currently" => %{ "temperature" => 86.0, "apparentTemperature" => 86.0, "dewPoint" => 86.0 }}
    current = ForecastIO.current_celsius(result)
    assert 30.0 = current["temperature"]
    assert 30.0 = current["apparentTemperature"]
    assert 30.0 = current["dewPoint"]
  end
end
