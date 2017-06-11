defmodule Exthereum.Transport do

  defmacro __using__(_opts) do
    quote do
      @spec send(method :: String.t, params :: map) :: {:ok, map} | {:error, String.t}
      def send(method, params \\ %{}) do
        enc = %{"method": method, "params": params, "id": 0}
          |> Poison.encode!
        resp = HTTPoison.post!(Application.get_env(:exthereum, :eth_server_url), enc)
        case Poison.decode(resp.body) do
          {:ok, body} ->
            {:ok, unhex(body["result"])}
          _ ->
            {:error, "bad_response"}
        end
      end

      @spec unhex(String.t) :: String.t
      def unhex("0x"<>str) do
        str
      end
      @spec unhex(String.t) :: String.t
      def unhex(str) do
        str
      end

    end
  end

end
