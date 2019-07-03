class CreateItemfiltervalues < ActiveRecord::Migration[5.1]
  def change
    create_table :itemfiltervalues, id: false do |t|
      t.references :item,         index: true, foreign_key: true
      t.references :filtervalue,  index: true, foreign_key: true
      t.timestamps
    end
  end
end
