class CareTables < ActiveRecord::Migration
  def change

  	create_table :needs do |t|
  		t.string :description
  		t.integer :frequency
  		t.references :care
  		t.timestamps
  	end

  	create_table :cares do |t|
  		t.string :description
  		t.timestamps
  	end

  	create_table :plans do |t|
  		t.string :title
  		t.string :provider
  		t.string :category
  		t.decimal :cost
  		t.timestamps
  	end

  	create_table :cares_plans do |t|
  		t.integer :cover_percent
  		t.boolean :covered
  		t.boolean :limited_visits, default: false
  		t.integer :visits
  		t.references :plan, :care
  		t.timestamps
  	end

  end
end
