class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :message
      t.belongs_to :user
      t.references :reviewable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
