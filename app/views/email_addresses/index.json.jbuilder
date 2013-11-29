json.array!(@email_addresses) do |email_address|
  json.extract! email_address, :email, :person_id
  json.url email_address_url(email_address, format: :json)
end
