require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/recruiter/jobs", type: :request do
  let(:valid_attributes) { attributes_for(:job, recruiter_id: create(:recruiter).id) }

  let(:invalid_attributes) { attributes_for(:job, recruiter_id: nil) }

  let(:token) { JsonWebToken.encode(recruiter_id: create(:recruiter).id) }

  let(:valid_headers) {
    {
      'Authorization' => token,
      'Content-Type' => "application/json"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Job.create! valid_attributes
      get recruiter_jobs_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      job = Job.create! valid_attributes
      get recruiter_jobs_url(job), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Job" do
        expect {
          post recruiter_jobs_path,
               params: { recruiter_job: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Job, :count).by(1)
      end

      it "renders a JSON response with the new recruiter_job" do
        post recruiter_jobs_path,
             params: { recruiter_job: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(/application\/json/)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Job" do
        expect {
          post recruiter_jobs_path,
               params: { recruiter_job: invalid_attributes }, as: :json
        }.to change(Job, :count).by(0)
      end

      it "renders a JSON response with errors for the new recruiter_job" do
        post recruiter_jobs_path,
             params: { recruiter_job: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(/application\/json/)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { title: "New Title" }
      }
      it "updates the requested recruiter_job" do
        job = Job.create! valid_attributes
        patch recruiter_job_path(job),
              params: { recruiter_job: new_attributes }, headers: valid_headers, as: :json
        job.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the recruiter_job" do
        job = Job.create! valid_attributes
        patch recruiter_job_path(job),
              params: { recruiter_job: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(/application\/json/)
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the recruiter_job" do
        job = Job.create! valid_attributes
        patch recruiter_job_url(job),
              params: { recruiter_job: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(/application\/json/)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested recruiter_job" do
      job = Job.create! valid_attributes
      expect {
        delete recruiter_job_url(job), headers: valid_headers, as: :json
      }.to change(Job, :count).by(-1)
    end
  end
end
