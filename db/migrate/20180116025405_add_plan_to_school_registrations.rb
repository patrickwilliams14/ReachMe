class AddPlanToSchoolRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :school_registrations, :plan_name, :string
  end
end
