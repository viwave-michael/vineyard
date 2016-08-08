class SensorDataController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:uplink]

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

  def uplink
    payload = Hash.from_xml(request.raw_post)["DevEUI_uplink"]["payload_hex"]
    @datum = SensorDatum.new(
      dev_eui: params[:LrnDevEui], port: params[:LrnFPort],
      info: params[:LrnInfos], payload: payload)
    @datum.save
    
    respond_to do |format|
      format.xml { render xml: "OK" }
    end
  end

  private
    def data_params
      params.require(:sensor_datum).permit(:dev_eui, :port, :info, :payload)
    end
end
