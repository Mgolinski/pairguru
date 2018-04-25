class TitleBracketsValidator < ActiveModel::Validator
  def validate(movie)
    title = movie.title
    unless title.count('[') == title.count(']')
      movie.errors[:title] << "Missing bracket!"
    end

    unless title.count('{') == title.count('}')
      movie.errors[:title] << "Missing curly bracket!"
    end

    unless title.count('(') == title.count(')')
      movie.errors[:title] << "Missing paren!"
    end

    if title.include?('[') && title.include?(']') && title.rindex('[') > title.rindex(']')
      movie.errors[:title] << "Mismatched brackets!"
    end

    if title.include?('{') && title.include?('}') && title.rindex('{') > title.rindex('}')
      movie.errors[:title] << "Mismatched curly brackets!"
    end

    if title.include?('(') && title.include?(')') && title.rindex('(') > title.rindex(')')
      movie.errors[:title] << "Mismatched parens!"
    end

    if title.include? '[]'
      movie.errors[:title] << "Empty brackets!"
    end

    if title.include? '{}'
      movie.errors[:title] << "Empty curly brackets!"
    end

    if title.include? '()'
      movie.errors[:title] << "Empty parens!"
    end
  end
end
