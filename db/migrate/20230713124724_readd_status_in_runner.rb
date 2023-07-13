class ReaddStatusInRunner < ActiveRecord::Migration[7.0]
  def change
    remove_column :runners, :status
    add_column :runners, :status, :string
  end
end
