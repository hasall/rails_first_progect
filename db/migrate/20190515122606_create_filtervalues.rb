class CreateFiltervalues < ActiveRecord::Migration[5.1]
  def change
    create_table :filtervalues do |t|
      t.string :value
      t.belongs_to :filter, index: true
      t.timestamps
    end
  end
end
