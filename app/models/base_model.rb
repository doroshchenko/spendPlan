class BaseModel < ActiveRecord::Base
  self.abstract_class = true

  def self.by_month_year(month, year)
    dt = DateTime.new(year, month)
    boy = dt.beginning_of_month
    eoy = dt.end_of_month
    where("created_at >= ? and created_at <= ?", boy, eoy)
  end
end