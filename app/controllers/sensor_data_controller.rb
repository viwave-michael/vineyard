class SensorDataController < ApplicationController
  def index
    @sensor_data = SensorDatum.all
  end

  def new
  end

  def create
    @datum = SensorDatum.new(data_params)

    if @datum.save
      redirect_to sensor_data_path, notice: 'Sensor datum created!'
    else
      render :new
    end
  end

  def destroy
    @datum = SensorDatum.find(params[:id])

    @datum.destroy
    redirect_to sensor_data_path, notice: 'Sensor datum destroyed!'
  end

  private
    def data_params
      params.require(:sensor_datum).permit(:dev_eui, :port, :info, :payload)
    end
end
