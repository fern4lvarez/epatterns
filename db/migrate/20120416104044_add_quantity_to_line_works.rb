class AddQuantityToLineWorks < ActiveRecord::Migration
  def self.up
    add_column :line_works, :quantity, :integer, :default => 1
  end
  
  def self.down
    remove_column :line_works, :quantity
  end
end
