class Stat < ActiveRecord::Base

  validates_presence_of :web, :opt_in, :unique

  def opt_in_percentage
    opt_in.zero? ? 0 : ((opt_in.to_f / total_entries.to_f) * 100).round(2)
  end

  def total_entries
    Entry.all.count
  end
end