defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    file = File.read("#{filename}.csv")
    handle_file(file)
  end

  defp handle_file({:ok, result}) do
    result =
      result
    |> String.split(",")
    |> Enum.map(fn number -> String.to_integer(number) end)
    |> Enum.sum()

    {:ok, %{result: result}}
  end
  defp handle_file({:error, _undefined}), do: {:error, "Invalid File!"}
end
