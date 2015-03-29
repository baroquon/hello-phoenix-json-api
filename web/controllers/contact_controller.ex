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

  def create(conn, params) do
    contact = %Contact{name: params["name"], phone: params["phone"]}
    Repo.insert(contact)

    redirect conn, Router.contact_path(:index)

  end
end
