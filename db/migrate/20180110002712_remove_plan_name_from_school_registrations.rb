class RemovePlanNameFromSchoolRegistrations < ActiveRecord::Migration[5.0]
  def change
    remove_column :school_registrations, :plan_name, :string
  end
end
