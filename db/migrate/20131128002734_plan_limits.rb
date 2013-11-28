class PlanLimits < ActiveRecord::Migration
  def change
  	add_column :plans, :deductible, :decimal
  	add_column :plans, :annual_limit, :decimal
  end
end
