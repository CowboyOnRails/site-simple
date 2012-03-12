class Metaitem < ActiveRecord::Base
  belongs_to :article

  validates :title, :length => {:maximum => 255}
end
