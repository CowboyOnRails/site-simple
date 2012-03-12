class Feedback < ActiveRecord::Base
  validates :name, :email, :title, :presence => true, :length => {:maximum => 255}
  validates :message, :presence => true
  validates :email, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
end
