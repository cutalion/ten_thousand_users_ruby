require 'grape'
require 'sequel'
require 'active_record'

DB = Sequel.connect(
  "postgres://#{ENV['LOGNAME']}@localhost/ten_thousand_users_ruby"
)

ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  host:     'localhost',
  username: ENV['LOGNAME'],
  database: 'ten_thousand_users_ruby'
)

class User < ActiveRecord::Base
end

module TenThousandUsers
  class API < Grape::API
    version 'v1', using: :header, vendor: 'twitter'
    format :json

    get '/' do
      # DB[:users].all
      User.all
    end
  end
end

run TenThousandUsers::API
