class AddPriceToSchoolRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :school_registrations, :price, :decimal
  end
end