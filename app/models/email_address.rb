class EmailAddress < ActiveRecord::Base
  belongs_to :Person
  validates :email, presence: true
end
