class OneCommentPerMoviePerUser < ActiveModel::Validator
  def validate(comment)
    movie = comment.movie_id
    user = comment.user_id

    if Comment.where(:movie => movie, :user => movie).length != 0
        comment.errors[:movie] << "This user has commented this movie already!"
    end
  end
end
