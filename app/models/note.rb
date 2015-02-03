class Note < ActiveRecord::Migration
  belongs_to :task
  validates :body, presence: true
end