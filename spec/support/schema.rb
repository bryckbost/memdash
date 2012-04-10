require 'active_record'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => ':memory:')

ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
  create_table :memdash_reports do |t|
    t.text :stats
    t.datetime :created_at
  end
end
