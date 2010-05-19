class CreateSampleTasks < ActiveRecord::Migration
  def self.up
    create_table :sample_tasks do |t|
      t.string :name
      t.string :cron
      t.integer :times
      t.boolean :done
	  t.string :job_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sample_tasks
  end
end
