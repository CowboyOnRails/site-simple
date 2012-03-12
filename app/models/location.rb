class Location < ActiveRecord::Base
	validates :phone1, :phone2, :adress, :sitename, :copyright, :length => {:maximum => 255}
	validates :email, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}, :presence => true
end
