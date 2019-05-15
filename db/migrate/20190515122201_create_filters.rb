class CreateFilters < ActiveRecord::Migration[5.1]
  def change
    create_table :filters do |t|
      t.string :name
      t.belongs_to :category
      t.timestamps
    end
  end
end
