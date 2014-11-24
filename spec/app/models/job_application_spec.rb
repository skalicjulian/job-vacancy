require 'spec_helper'

describe JobApplication do

	describe 'model' do

		subject { @job_offer = JobApplication.new }

		it { should respond_to( :job_offer) }
		it { should respond_to( :user) }

	end

	describe 'create_for' do

		it 'should set user' do
	  	offer = JobOffer.new
	  	user = User.new
	  	ja = JobApplication.create_for(offer, user)
	  	ja.user.should eq user
	  end

	  it 'should set job_offer' do
	  	offer = JobOffer.new
	  	user = User.new
	  	ja = JobApplication.create_for(offer, user)
	  	ja.job_offer.should eq offer
	  end

	end

	before(:each) do
	  	@job_offer = double
	  	allow(@job_offer).to receive(:id)
	  	allow(@job_offer).to receive(:offer_title).and_return("Programmer")
	  	allow(@job_offer).to receive(:offer_description).and_return("Good job!")
	  	allow(@job_offer).to receive(:offer_location).and_return("Buenos Aires")
	end

	describe 'title' do

		it 'should get job_offer title' do
	  	user = User.new
	  	ja = JobApplication.create_for(@job_offer, user)
	  	expect(ja.offer_title).to eq("Programmer")
	  end

	  it 'should get job_offer location' do
	  	user = User.new
	  	ja = JobApplication.create_for(@job_offer, user)
	  	expect(ja.offer_location).to eq("Buenos Aires")
	  end

	  it 'should get job_offer description' do
	  	user = User.new
	  	ja = JobApplication.create_for(@job_offer, user)
	  	expect(ja.offer_description).to eq("Good job!")
	  end
	end

end