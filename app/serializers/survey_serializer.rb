class SurveySerializer < ApplicationSerializer
  attributes :id, :title, :sub_title, :questions, :publish_results, :receive_results
  has_one :user

  def id
    object.id.to_s
  end

  def questions
    JSON.parse(object.questions)
  end
end
