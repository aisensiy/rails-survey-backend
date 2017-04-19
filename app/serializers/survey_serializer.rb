class SurveySerializer < ApplicationSerializer
  attributes :id, :title, :sub_title, :questions, :publish_results, :receive_results
  has_one :user_id
end
