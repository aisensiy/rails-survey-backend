class Result < ApplicationRecord
  belongs_to :survey
  serialize :result, Hash
end
