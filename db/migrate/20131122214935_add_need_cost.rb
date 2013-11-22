class AddNeedCost < ActiveRecord::Migration
  def change
  	add_column :needs, :cost, :decimal
  end
end
