class ChangeCostToStringInCards < ActiveRecord::Migration[6.0]
  def change
  	change_column :cards, :cost, :string
  end
end
