class JobApplication
	include DataMapper::Resource

	property :id, Serial 
	
	belongs_to :job_offer
	belongs_to :user 

	def self.create_for(offer, user)
		app = JobApplication.new
		app.job_offer = offer
		app.user = user
		app
	end

	def offer_title
		job_offer.title
	end

	def offer_location
		job_offer.location
	end

	def offer_description
		job_offer.description
	end

	def applicant_name
		user.name
	end

	def applicant_email
		user.email
	end


end
