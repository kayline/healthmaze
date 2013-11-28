class CareCosts < ActiveRecord::Migration
  def change
  	add_column :plans_users, :care_costs, :decimal, :default => 0
  end
end
