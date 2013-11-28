class Usermodel < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name
  		t.timestamps
  	end

  	create_table :plans_users do |t|
  		t.decimal :total_cost, :default => 0
  		t.references :user, :plan
  	end
  end
end
