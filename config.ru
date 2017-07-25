require 'grape'
require 'sequel'

DB = Sequel.connect(
  "postgres://#{ENV['LOGNAME']}@localhost/ten_thousand_users_ruby"
)

module TenThousandUsers
  class API < Grape::API
    version 'v1', using: :header, vendor: 'twitter'
    format :json

    get '/' do
      DB[:users].all
    end
  end
end

run TenThousandUsers::API
