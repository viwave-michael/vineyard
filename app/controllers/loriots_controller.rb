class LoriotsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @loriots = Loriot.all
  end

  def new
  end

  def create
    if request.format.json?
      @loriot = Loriot.new({
        raw_data: request.raw_post
      })
    elsif request.format.html?
      @loriot = Loriot.new(loriot_params)
    end

    respond_to do |format|
      if @loriot.save
        format.html { redirect_to loriots_path, notice: "Loriot created!" }
        format.json { render json: { "status": "OK" } }
      else
        format.html { render :new }
        format.json { render json: { "errir": @loriot.errors.full_messages } }
      end
    end
  end

  def destroy
    @loriot = Loriot.find(params[:id])

    @loriot.destroy
    redirect_to loriots_path, notice: "Loriot deleted!"
  end

  private

    def loriot_params
      params.require(:loriot).permit(:raw_data)
    end
end
