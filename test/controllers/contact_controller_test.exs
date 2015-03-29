defmodule HelloPhoenix.ContactControllerTest do
  use ExUnit.Case, async: false
  use Plug.Test
  alias HelloPhoenix.Contact
  alias HelloPhoenix.Repo
  alias Ecto.Adapters.SQL

  setup do
    SQL.begin_test_transaction(Repo)

    on_exit fn ->
      SQL.rollback_test_transaction(Repo)
    end
  end

  test "/index returns a list of contacts" do
    contacts_as_json =
      %Contact{name: "Gumbo", phone: "(801) 555-5555"}
      |> Repo.insert
      |> List.wrap
      |> Poison.encode!

    response = conn(:get, "/api/contacts") |> send_request

    assert response.status == 200
    assert response.resp_body == contacts_as_json
  end

  defp send_request(conn) do
    conn
    |> put_private(:plug_skip_csrf_protection, true)
    |> HelloPhoenix.Endpoint.call([])
  end
end
