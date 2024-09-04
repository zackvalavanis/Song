class SingsController < ApplicationController
  def index 
    sing = Sing.all  
    render :index
  end
end
