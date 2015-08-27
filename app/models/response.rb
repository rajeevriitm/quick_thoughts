class Response < ActiveRecord::Base
  belongs_to :thought
  belongs_to :resp, class_name: "Thought"
  validates :resp_id,presence: true
end
