class AddOutputToRunner < ActiveRecord::Migration[7.0]
  def change
    add_column :runners, :output, :string
  end
end
