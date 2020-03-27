class AddThingsToTabl < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :endpoints , default: Time.now
    add_timestamps :gbasubgroups , default: Time.now
    add_timestamps :iqsubgroups , default: Time.now
    add_timestamps :subgroups , default: Time.now
    add_timestamps :studies , default: Time.now
    add_timestamps :study_arms , default: Time.now
  end
end
