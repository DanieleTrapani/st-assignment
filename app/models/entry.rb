class Entry < ApplicationRecord
  belongs_to :user
  validates :company, :kwh, :startdate, :enddate, presence: true
  validates :kwh, numericality: { greater_than: 0 }
  validates :end_date, comparison: { greater_than: :start_date }

  def start_date
    startdate.strftime('%d/%m/%Y')
  end

  def end_date
    enddate.strftime('%d/%m/%Y')
  end
end
