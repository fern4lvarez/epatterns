class CreateLineWorks < ActiveRecord::Migration
  def change
    create_table :line_works do |t|
      t.integer :pattern_id
      t.integer :portfolio_id

      t.timestamps
    end
  end
end
