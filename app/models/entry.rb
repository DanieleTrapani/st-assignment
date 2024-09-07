class Entry < ApplicationRecord
  belongs_to :user
  validates :company, :kwh, :startdate, :enddate, presence: true

  def start_date
    startdate.strftime('%d/%m/%Y')
  end

  def end_date
    enddate.strftime('%d/%m/%Y')
  end
end
