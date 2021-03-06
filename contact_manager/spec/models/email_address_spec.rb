require 'spec_helper'

describe EmailAddress do
  let(:emailaddress) do
    EmailAddress.new(email: 'example@example.com', contact_id: 1, contact_type: 'Person')
  end

  it 'is valid' do
    expect(emailaddress).to be_valid
  end

  it 'is invalid without an email address' do
    emailaddress.email = nil
    expect(emailaddress).to_not be_valid
  end

  it 'must have a reference to a person' do
    emailaddress.contact_id = nil
    expect(emailaddress).to_not be_valid
  end
end
