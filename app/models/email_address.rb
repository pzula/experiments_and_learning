class EmailAddress < ActiveRecord::Base
  belongs_to :person
  validates :email, presence: true
  validates :person_id, presence: true
end
