class MicropostsController < ApplicationController
  def new
  end

  def create
    @micropost = current_user.microposts.new(params[:micropost])
    respond_to do |format|
      if @micropost.save
        format.html {redirect_to :profile, :notice => "Tweet posted"}
        format.js
      else
        render :home
      end    
    end
  end

  def index
  end

  def destroy
    @micropost = current_user.microposts.find(params[:id])
    @micropost.destroy
    
    respond_to do |format|
      format.html {redirect_to :profile, :notice => "Tweet deleted"}
      format.js
    end    
  end

end
