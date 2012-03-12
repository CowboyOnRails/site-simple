class Article < ActiveRecord::Base
	has_one :metaitem, :dependent => :destroy
	
	has_many :childs, :class_name=>'Article', :foreign_key => 'parent_id', :dependent => :destroy
	belongs_to :father, :class_name=>'Article', :foreign_key => 'parent_id'

	validates :name, :slug, :presence =>true, :length => {:maximum => 255}
	
	validates :position, :parent_id, :numericality => {:only_integer => true}
	validates :home, :uniqueness => true, :if => 'self.home' #validate if home checked
	
    scope :top, where('top = true')
    scope :desc, order('position DESC')

	def to_param
		"#{id}-#{slug}"
	end
    
    #def set_home?
    #	self.home == true
    #end
	#def check_home
	#	if self.home == true
	#		validates :home, :uniqueness => true
	#	end
	#end
end
