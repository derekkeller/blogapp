class PagesController < ApplicationController
  def home
    @micropost_user_ids = current_user.followers.collect {|follower| follower.id}
    
    @microposts = Micropost.where('user_id = ? OR ?', @micropost_user_ids, current_user.id)
  end

  def contact
  end

end
