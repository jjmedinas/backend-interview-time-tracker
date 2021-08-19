class CreateTimeSegment < ActiveRecord::Migration[6.1]
  def change
    create_table :time_segments do |t|
      t.datetime :started_at
      t.datetime :stopped_at
      t.belongs_to :project, null: false
      t.boolean :current
    end
  end
end
