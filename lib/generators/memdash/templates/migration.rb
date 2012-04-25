class CreateMemdashActiveRecordReports < ActiveRecord::Migration
  def self.up
    create_table :memdash_reports do |table|
      table.text :stats
      table.datetime :created_at
    end
  end

  def self.down
    drop_table :memdash_reports
  end
end
