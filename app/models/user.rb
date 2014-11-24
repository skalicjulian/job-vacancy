class User
  include DataMapper::Resource

  #roles
  APPLICANT = 'applicant'
  OFFERER = 'offerer'

  #properties
  property :id, Serial
  property :name, String
  property :crypted_password, String
  property :email, String
  property :role, String
  
  has n, :job_offers
  has n, :job_applications

  #validations
  validates_presence_of :name, :email, :role
  validates_format_of   :email,             :with => :email_address
  validates_presence_of :crypted_password
  

  def password= (password)
    self.crypted_password = ::BCrypt::Password.create(password) unless password.nil?	
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.has_password?(password)? user : nil
  end

  def has_password?(password)
    ::BCrypt::Password.new(crypted_password) == password
  end

  def self.valid_email?(email)
    true
  end

  def self.already_in_use?(email) 
    user = User.find_by_email(email)
    not user.nil?
  end

  def self.new_applicant
    applicant = User.new
    applicant.role = APPLICANT
    applicant
  end

  def self.generate_applicant(params)
    applicant = User.new(params)
    applicant.role = APPLICANT
    applicant
  end

  def self.new_offerer
    offerer = User.new
    offerer.role = OFFERER
    offerer
  end

  def self.generate_offerer(params)
    offerer = User.new(params)
    offerer.role = OFFERER
    offerer
  end

  def is_applicant?
    @role == APPLICANT
  end

  def is_offerer?
    @role == OFFERER
  end
  
end
