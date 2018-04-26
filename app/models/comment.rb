class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates_with OneCommentPerMoviePerUser

end
