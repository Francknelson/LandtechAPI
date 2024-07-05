class Recruiter::SubmissionsController < ApplicationController
  before_action :set_recruiter_submission, only: %i[ show update destroy ]
  before_action :set_recruiter_job, only: %i[ new create edit update ]

  # GET /recruiter/submissions
  # GET /recruiter/submissions.json
  def index
    @recruiter_submissions = Submission.all
  end

  # GET /recruiter/submissions/1
  # GET /recruiter/submissions/1.json
  def show
    @recruiter_submission = Submission.find_by(id: params[:id])

    if @recruiter_submission
      render json: @recruiter_submission, status: :ok
    else
      render json: { message: 'Submission not found' }, status: :not_found
    end
  end

  # POST /recruiter/submissions
  # POST /recruiter/submissions.json
  def create
    @recruiter_submission = Submission.create(recruiter_submission_params)

    if @recruiter_submission.save
      render :show, status: :created
    else
      render json: @recruiter_submission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recruiter/submissions/1
  # PATCH/PUT /recruiter/submissions/1.json
  def update
    if @recruiter_submission.update(recruiter_submission_params)
      render :show, status: :ok
    else
      render json: @recruiter_submission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recruiter/submissions/1
  # DELETE /recruiter/submissions/1.json
  def destroy
    if @recruiter_submission
      @recruiter_submission.destroy
      render json: { message: 'Submission deleted' }, status: :ok
    else
      render json: { message: 'Submission not found' }, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruiter_submission
      @recruiter_submission = Submission.find_by(id: params[:id])
      end

    def set_recruiter_job
      @recruiter_job = Job.find_by(id: params[:job_id])
    end

    # Only allow a list of trusted parameters through.
    def recruiter_submission_params
      params.require(:recruiter_submission).permit(:name, :email, :mobile_phone, :resume, :job_id)
    end
end
