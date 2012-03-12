require 'tableless'

class Feedback < Tableless
  validates :name, :email, :message, :title, :presence => true
  validates :email, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  attr_accessor :name, :email, :message, :title
end