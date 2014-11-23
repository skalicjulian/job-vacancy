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
  	allow(@job_offer).to receive(:title).and_return("offer_title")
  	allow(@job_offer).to receive(:description).and_return("offer_description")
  	allow(@job_offer).to receive(:location).and_return("offer_location")
  	allow(@job_offer).to receive(:id)
	end

	describe 'title' do

		it 'should get job_offer title' do
	  	user = User.new
	  	ja = JobApplication.create_for(@job_offer, user)
	  	expect(ja.title).to eq("offer_title")
	  end

	  it 'should get job_offer location' do
	  	user = User.new
	  	ja = JobApplication.create_for(@job_offer, user)
	  	expect(ja.location).to eq("offer_location")
	  end

	  it 'should get job_offer description' do
	  	user = User.new
	  	ja = JobApplication.create_for(@job_offer, user)
	  	expect(ja.description).to eq("offer_description")
	  end
	end

end
