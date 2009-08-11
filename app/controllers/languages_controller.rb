class LanguagesController < ApplicationController
  def update
    redirect_back_or_default root_path(:locale => params[:language])
  end
end
