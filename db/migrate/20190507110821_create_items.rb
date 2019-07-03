class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.belongs_to :user, index: true
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
