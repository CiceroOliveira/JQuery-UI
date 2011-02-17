module RelationshipsHelper
  def tab_id(tab_order, connection)
    "tabs-#{tab_order}#{connection.client.id}#{connection.prospect.id}"
  end
end
