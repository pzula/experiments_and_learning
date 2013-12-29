class EmailAddress < ActiveRecord::Base
  belongs_to :person
  validates :email, presence: true
  validates :contact_id, presence: true
  belongs_to :contact, polymorphic: true
end
