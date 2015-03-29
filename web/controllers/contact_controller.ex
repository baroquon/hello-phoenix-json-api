defmodule HelloPhoenix.ContactController do
  use HelloPhoenix.Web, :controller
  alias HelloPhoenix.Repo
  alias HelloPhoenix.Contact

  plug :action

  def index(conn, _params) do
    contacts = Repo.all(Contact)
    render conn, contacts: contacts
  end

  def new(conn, _params) do
    render conn, "new"
  end

  def create(conn, %{"contact" => %{"name" => name}}) do
    contact = %Contact{name: name}

    case Contact.validate(contact) do
      [] ->
        contact = Repo.insert(contact)
    end
  end

end
