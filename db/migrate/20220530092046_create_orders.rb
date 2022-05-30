class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer         :buy_count,    null: false
      t.references      :performance,  null: false, foreign_key: true
      t.references      :schedule,     null: false, foreign_key: true
      t.references      :user,         null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
