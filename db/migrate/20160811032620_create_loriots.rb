class CreateLoriots < ActiveRecord::Migration[5.0]
  def change
    create_table :loriots do |t|
      t.string :raw_data

      t.timestamps
    end
  end
end
