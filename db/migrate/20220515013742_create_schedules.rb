class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.date          :performance_day,      null: false
      t.time          :performance_time,     null: false
      t.integer       :stock,                null: false
      t.references    :performance,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
