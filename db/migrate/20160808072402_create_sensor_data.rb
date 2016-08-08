class CreateSensorData < ActiveRecord::Migration[5.0]
  def change
    create_table :sensor_data do |t|
      t.string :dev_eui
      t.integer :port
      t.string :info
      t.string :payload

      t.timestamps
    end
  end
end
