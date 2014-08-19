class ChangeCredit < ActiveRecord::Migration
  def change
    change_column :credits, :credits, :boolean
  end
end
