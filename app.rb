# require gems
require 'sinatra'
require 'sqlite3'
require_relative 'utility'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("links.db")
#db.results_as_hash = true

link_groups = db.execute <<-SQL
    SELECT name FROM sqlite_master
    WHERE type='table';
  SQL

get '/' do

  @headers = link_groups.flatten

  @headers.each_index {|i| @headers[i] = parse_table_name(@headers[i])}

  @headers.to_s
end

