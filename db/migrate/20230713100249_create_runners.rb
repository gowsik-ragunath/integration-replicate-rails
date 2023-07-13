class CreateRunners < ActiveRecord::Migration[7.0]
  def change
    create_table :runners do |t|
      t.string :prediction_id
      t.integer :status

      t.timestamps
    end
  end
end
