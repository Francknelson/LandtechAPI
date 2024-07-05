class Recruiter::JobsController < ApplicationController
  before_action :authorize_request, except: :index
  before_action :set_recruiter_job, only: %i[ show update destroy ]
  before_action :set_recruiter, only: %i[ new create edit update ]

  # GET /recruiter/jobs
  # GET /recruiter/jobs.json
  def index
    @recruiter_jobs = Job.search(params[:search])
  end

  # GET /recruiter/jobs/1
  # GET /recruiter/jobs/1.json
  def show
    @recruiter_job = Job.find_by(id: params[:id])

    if @recruiter_job
      render json: @recruiter_job, status: :ok
    else
      render json: { message: 'Job not found' }, status: :not_found
    end
  end

  # POST /recruiter/jobs
  # POST /recruiter/jobs.json
  def create
    @recruiter_job = Job.create(recruiter_job_params)

    if @recruiter_job.save
      render :show, status: :created
    else
      render json: @recruiter_job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recruiter/jobs/1
  # PATCH/PUT /recruiter/jobs/1.json
  def update
    if @recruiter_job.update(recruiter_job_params)
      render :show, status: :ok
    else
      render json: @recruiter_job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recruiter/jobs/1
  # DELETE /recruiter/jobs/1.json
  def destroy
    if @recruiter_job
      @recruiter_job.destroy
      render json: { message: 'Job deleted' }, status: :ok
    else
      render json: { message: 'Job not found' }, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruiter_job
      @recruiter_job = Job.find_by(id: params[:id])
    end

    def set_recruiter
      @recruiter = Recruiter.find_by(id: params[:recruiter_id])
    end

      # Only allow a list of trusted parameters through.
    def recruiter_job_params
      params.require(:recruiter_job).permit(:title, :description, :start_date, :end_date, :status, :skills, :recruiter_id, :search)
    end
end
