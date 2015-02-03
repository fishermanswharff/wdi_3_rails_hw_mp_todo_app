class Note < ActiveRecord::Base
  belongs_to :task
  validates :body, presence: true
end