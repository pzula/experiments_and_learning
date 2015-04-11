require "spec_helper"

describe "Viewing an individual event" do
  it "show's the events details" do
    event = Event.create(event_attributes(price: 10.00))

    visit event_url(event)

    expect(page).to have_text(event.name)
    expect(page).to have_text(event.location)
    expect(page).to have_text(event.description[0..10])
    expect(page).to have_text(event.starts_at)
    expect(page).to have_text("$10.00")
  end
end