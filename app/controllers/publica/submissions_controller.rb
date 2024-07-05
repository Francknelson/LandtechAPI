class Publica::SubmissionsController < ApplicationController
  # POST /publica/submissions
  # POST /publica/submissions.json
  def create
    @publica_submission = Submission.create(publica_submission_params)

    if @publica_submission.save
      render :show, status: :created
    else
      render json: @publica_submission.errors, status: :unprocessable_entity
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def publica_submission_params
      params.require(:publica_submission).permit(:name, :email, :mobile_phone, :resume, :job_id)
    end
end
