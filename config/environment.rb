require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'
require 'tty-prompt'

require 'bundler/setup'
Bundler.require


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
ActiveRecord::Base.logger = nil