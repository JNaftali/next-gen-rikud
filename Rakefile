require 'rake'

require ::File.expand_path('../app', __FILE__)

# Include all of ActiveSupport's core class extensions, e.g., String#camelize
require 'active_support/core_ext'

namespace :db do
  desc "Create the database nextgenrikud"
  task :create do
    puts "Creating database at nextgenrikud if it doesn't exist..."
    exec("touch db/nextgenrikud.sqlite3")
  end

  desc "Drop the database nextgenrikud"
  task :drop do
    puts "Dropping database nextgenrikud..."
    exec("rm db/nextgenrikud.sqlite3")
  end

  desc "Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
  task :migrate do
    ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
      ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
    end
  end

  desc "populate the database with sample data"
  task :seed do
    require APP_ROOT.join('db', 'seeds.rb')
  end

end
