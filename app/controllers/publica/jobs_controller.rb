class Publica::JobsController < ApplicationController
  before_action :set_publica_job, only: %i[ show update destroy ]

  # GET /publica/jobs
  # GET /publica/jobs.json
  def index
    @publica_jobs = Job.search(params[:search])
  end

  # GET /publica/jobs/1
  # GET /publica/jobs/1.json
  def show
    @publica_job = Job.find_by(id: params[:id])

    if @publica_job
      render json: @publica_job, status: :ok
    else
      render json: { message: 'Job not found' }, status: :not_found
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publica_job
      @publica_job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def publica_job_params
      params.require(:publica_job).permit(:search)
    end
end
