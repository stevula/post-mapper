class RemoveLatitudeAndLongitudeFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :latitude, :float
    remove_column :users, :longitude, :float
  end
end
