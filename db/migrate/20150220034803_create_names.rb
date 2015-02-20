class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps null: false
    end
  end
end
