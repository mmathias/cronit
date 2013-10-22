class Business < User
	has_many :products, dependent: :destroy 
  	validates :description, presence: true, length: { maximum: 150 }	

  	def feed 
    	self.products
  	end
end
