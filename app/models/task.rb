class Task < ActiveRecord::Base
  attr_accessible :status, :title_task
  belongs_to :list
  validates :title_task, presence: true, uniqueness: true
end
