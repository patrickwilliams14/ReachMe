class RenamePlanColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :school_registrations, :plan, :string
  end
end
