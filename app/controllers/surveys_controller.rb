class SurveysController < ApplicationController
  before_action :authorize, only: [:create, :update, :destroy, :index]
  before_action :set_user, only: [:create, :destroy, :index]
  before_action :set_survey, only: [:show, :update, :destroy]

  # GET /surveys
  def index
    @surveys = @user.surveys

    render json: @surveys
  end

  # GET /surveys/1
  def show
    render json: @survey
  end

  # POST /surveys
  def create
    @survey = Survey.new(
      title: survey_params[:title],
      sub_title: survey_params[:sub_title],
      questions: survey_params[:questions].to_json,
      user: @user
    )

    if @survey.save
      render json: @survey, status: :created, location: @survey
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /surveys/1
  def update
    @survey.title = survey_params[:title] if !survey_params[:title].nil?
    @survey.sub_title = survey_params[:sub_title] if !survey_params[:sub_title].nil?
    @survey.receive_results = survey_params[:receive_results] if !survey_params[:receive_results].nil?
    @survey.publish_results = survey_params[:publish_results] if !survey_params[:publish_results].nil?
    @survey.questions = survey_params[:questions].to_json if !survey_params[:questions].nil?

    if @survey.save
      render json: @survey
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  # DELETE /surveys/1
  def destroy
    @survey.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Only allow a trusted parameter "white list" through.
    def survey_params
      params.permit(:publish_results, :receive_results, :title, :sub_title, :questions => [:_id, :type, :title, :placeholder, :objectId, :options => [:content, :objectId, :_id]])
    end
end
