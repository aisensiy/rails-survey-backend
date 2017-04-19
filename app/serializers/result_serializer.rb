class ResultSerializer < ApplicationSerializer
  attributes :id, :result

  def content
    object.result || {}
  end
end
