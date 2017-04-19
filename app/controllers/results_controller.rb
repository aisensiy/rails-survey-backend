class ResultsController < ApplicationController
  before_action :set_survey

  def create
    @result = Result.new(result: JSON.parse(request.body.read))
    @result.survey = @survey

    if @result.save
      render json: @result, status: :created, location: [@survey, @result]
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @result = Result.find(params[:id])
    @result.destroy
  end

  def index
    @results = @survey.results
    render json: @results
  end

  private
    def set_survey
      @survey = Survey.find(params[:survey_id])
    end
end
