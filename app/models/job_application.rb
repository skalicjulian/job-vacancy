class JobApplication
	include DataMapper::Resource

	property :id, Serial 
	
	belongs_to :job_offer
	belongs_to :user 

	def self.create_for(offer, user)
		app = JobApplication.new
		app.job_offer= offer
		app.user= user
		app
	end

	def title
		job_offer.title
	end

	def location
		job_offer.location
	end

	def description
		job_offer.description
	end

end
