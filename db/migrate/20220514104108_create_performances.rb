class CreatePerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :performances do |t|
      t.string     :name,              null: false
      t.string     :theater,           null: false
      t.date       :start_day,         null: false
      t.date       :last_day,          null: false
      t.text       :info,              null: false
      t.integer    :price,             null: false
      t.references :admin_user,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
