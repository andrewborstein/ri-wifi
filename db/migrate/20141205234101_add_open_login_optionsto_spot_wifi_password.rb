class AddOpenLoginOptionstoSpotWifiPassword < ActiveRecord::Migration
  def change
    add_column :spots, :pw_open, :boolean
    add_column :spots, :pw_login, :boolean
  end
end
