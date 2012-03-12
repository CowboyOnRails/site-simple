class LocationsController < ApplicationController
 
  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    #respond_to do |format|
    #  if @location.update_attributes(params[:location])
    #    format.html { redirect_to @location, notice: 'Location was successfully updated.' }
    #    format.json { head :no_content }
    #  else
    #    format.html { render action: "edit" }
    #    format.json { render json: @location.errors, status: :unprocessable_entity }
    #  end
    #end
    if @location.update_attributes(params[:location])
      flash[:notice] = "Данные успешно сохранены"
      redirect_to :root
    else
      flash[:alert] = "При сохранении произошли ошибки"
      render :action => "edit"
    end
  end

end
