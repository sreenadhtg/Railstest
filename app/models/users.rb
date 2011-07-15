class Users < ActiveRecord::Base
    validates_confirmation_of :password
    validates_size_of :username, :password, :within => 5..15
end