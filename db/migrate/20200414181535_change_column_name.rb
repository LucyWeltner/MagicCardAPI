class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
  	rename_column :cards, :type, :creature_type
  end
end
