# encoding: utf-8
class LocationsController < ApplicationController
 
  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    
    if @location.update_attributes(params[:location])
      flash[:notice] = "Данные успешно сохранены"
      redirect_to :root
    else
      flash[:alert] = "При сохранении произошли ошибки"
      render :action => "edit"
    end
  end

end
