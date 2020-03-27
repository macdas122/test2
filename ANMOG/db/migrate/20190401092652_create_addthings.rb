class CreateAddthings < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :mains , default: Time.now
  end
end
