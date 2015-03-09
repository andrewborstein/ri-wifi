class AddIpRecordTable < ActiveRecord::Migration
  def change
    create_table :ip_records do |t|
      t.string :ip

      t.timestamps
    end
  end
end