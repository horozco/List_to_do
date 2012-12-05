class List < ActiveRecord::Base
  attr_accessible :title
  validates_presence_of (:title)
  has_many :tasks, dependent: :destroy
end