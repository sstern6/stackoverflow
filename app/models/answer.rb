class Answer < ActiveRecord::Base
  validates :content, presence: true

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
