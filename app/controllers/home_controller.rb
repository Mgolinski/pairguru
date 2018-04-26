class HomeController < ApplicationController
  def welcome; end

  def top
    @users = User.all
    @top = []
    @users.each do |u|
      @top << {:name => u.name, :number => u.comment.where('created_at >= ?', 2.weeks.ago).count} if u.comment.where('created_at >= ?', 2.weeks.ago).count > 0
    end
    @top.sort_by! {|hash| hash.values }
    @top.reverse![0..10]
  end
end
