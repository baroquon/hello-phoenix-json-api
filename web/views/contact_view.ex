defmodule HelloPhoenix.ContactView do
  use HelloPhoenix.Web, :view

  def render("index.json", %{contacts: contacts}) do
    contacts
  end

end
