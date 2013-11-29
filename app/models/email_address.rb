class EmailAddress < ActiveRecord::Base
  belongs_to :Person
  validates :email, presence: true
  validates :person_id, presence: true
end
