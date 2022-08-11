class AddColumnToSeats < ActiveRecord::Migration[5.2]
  def change
    add_column :seats, :column, :text
  end
end
