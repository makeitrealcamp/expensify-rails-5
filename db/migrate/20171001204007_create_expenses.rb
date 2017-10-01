class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.references :type, foreign_key: true
      t.references :category, foreign_key: true
      t.text :concept
      t.date :date
      t.integer :amount

      t.timestamps
    end
  end
end
