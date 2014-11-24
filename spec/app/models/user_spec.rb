require 'spec_helper'

describe User do

	describe 'model' do

		subject { @user = User.new }

		it { should respond_to( :id) }
		it { should respond_to( :name ) }
		it { should respond_to( :crypted_password) }
		it { should respond_to( :email ) }
		it { should respond_to( :role ) }

		it { should respond_to( :job_offers ) }
		it { should respond_to( :job_applications ) }

	end

	describe 'valid?' do

	  let(:user) { User.new }

	  it 'should be false when name is blank' do
	  	user.email = 'john.doe@someplace.com'
	  	user.password = 'a_secure_passWord!'
	  	user.valid?.should be_false
	  end


	  it 'should be false when email is not valid' do
	  	user.name = 'John Doe'
	  	user.email = 'john'
	  	user.password = 'a_secure_passWord!'
	  	user.valid?.should be_false
	  end

	  it 'should be false when password is blank' do
	  	user.name = 'John Doe'
	  	user.email = 'john.doe@someplace.com'
	  	user.valid?.should be_false
	  end

	  it 'should be true when all field are valid' do
	  	user.name = 'John Doe'
	  	user.email = 'john.doe@someplace.com'
	  	user.password = 'a_secure_passWord!'
	  	user.role = 'offerer'
	  	user.valid?.should be_true
	  end

	end

	describe 'authenticate' do

		before do
			@password = 'password'
		 	@user = User.new
		 	@user.email = 'john.doe@someplace.com'
		 	@user.password = @password
		end

		it 'should return nil when password do not match' do
			email = @user.email
			password = 'wrong_password'
			User.should_receive(:find_by_email).with(email).and_return(@user)
			User.authenticate(email, password).should be_nil
		end

		it 'should return nil when email do not match' do
			email = 'wrong@email.com'
			User.should_receive(:find_by_email).with(email).and_return(nil)
			User.authenticate(email, @password).should be_nil
		end

		it 'should return the user when email and password match' do
			email = @user.email
			User.should_receive(:find_by_email).with(email).and_return(@user)
			User.authenticate(email, @password).should eq @user
		end

	end

	describe 'user is_applicant?' do

		it 'should return true when is applicant' do
			applicant = User.generate_applicant( {:name => 'Applicant'})
			applicant.is_applicant?.should be_true
		end


		it 'should return false when is offerer' do
			applicant = User.generate_offerer( {:name => 'Applicant'})
			applicant.is_applicant?.should be_false
		end

	end

	describe 'user is_offerer?' do

		it 'should return true when is offerer' do
			offerer = User.generate_offerer( {:name => 'Offerer'})
			offerer.is_offerer?.should be_true
		end


		it 'should return false when is applicant' do
			offerer = User.generate_applicant( {:name => 'Offerer'})
			offerer.is_offerer?.should be_false
		end

	end

	describe 'email already_in_use?' do

		before(:each) do
			@email = 'applicant@test.com'
			@password = 'Passw0rd!'
		 	@registered_user = User.new
		 	@registered_user.email = @email
		 	@registered_user.password = @password
		end

		it 'should return true when email is already used by a registered user' do
			already_taken_email = @registered_user.email
			User.should_receive(:find_by_email).with(already_taken_email).and_return(@registered_user)
			User.already_in_use?(already_taken_email).should be_true
		end


		it 'should return false when email is not already used by a registered user' do
			not_used_email = 'jorgito@test.com'
			User.should_receive(:find_by_email).with(not_used_email).and_return(nil)
			User.already_in_use?(not_used_email).should be_false
		end

	end

	describe 'email is_valid?' do

		it 'should return true when is well formed email address' do
		end

		it 'should return false when is not well formed email address' do
		end

	end

	describe 'generate_applicant' do

		before(:each) do
			@registered_applicant = User.new
			@registered_applicant.name = 'Applicant'
			@registered_applicant.email = 'applicant@test.com'
			@registered_applicant.role = 'applicant'

			@registered_offerer = User.new
			@registered_offerer.name = 'Offerer'
			@registered_offerer.email = 'offerer@test.com'
			@registered_offerer.role = 'offerer'
		end

		it 'should be equals to registered_applicant' do
			applicant = User.generate_applicant( {:name => 'Applicant', :email => 'applicant@test.com'} )
			applicant.should eq @registered_applicant
		end

		it 'should not be equals to registered_applicant' do
			applicant = User.generate_applicant( {:name => 'Applicant', :email => 'applicant@test.com'} )
			applicant.should_not eq @registered_offerer
		end

	end

	describe 'generate_offerer' do

		before(:each) do
			@registered_applicant = User.new
			@registered_applicant.name = 'Applicant'
			@registered_applicant.email = 'applicant@test.com'
			@registered_applicant.role = 'applicant'

			@registered_offerer = User.new
			@registered_offerer.name = 'Offerer'
			@registered_offerer.email = 'offerer@test.com'
			@registered_offerer.role = 'offerer'
		end

		it 'should be equals to registered_offerer' do
			offerer = User.generate_offerer( {:name => 'Offerer', :email => 'offerer@test.com'} )
			offerer.should eq @registered_offerer
		end

		it 'should not be equals to registered_offerer' do
			offerer = User.generate_offerer( {:name => 'Offerer', :email => 'offerer@test.com'} )
			offerer.should_not eq @registered_applicant
		end

	end

end

