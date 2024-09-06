class Entry < ApplicationRecord
  belongs_to :user
  validates :company, :kwh, :startdate, :enddate, presence: true
end
