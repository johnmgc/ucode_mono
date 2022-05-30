
class PublishesController < ApplicationController
  before_action :set_publish, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except:[:index]

  # GET /publishes or /publishes.json
  def index
    @publishes = Publish.all
  end

  # GET /publishes/1 or /publishes/1.json
  def show
  end

  # GET /publishes/new
  def new
    @publish = Publish.new
  end

  # GET /publishes/1/edit
  def edit
  end

  # POST /publishes or /publishes.json
  def create
    @publish = Publish.new(publish_params)
    #binding.break
    @publish.usuario_id = current_user.id
    respond_to do |format|
      if @publish.save
        format.html { redirect_to publish_url(@publish), notice: "Publish was successfully created." }
        format.json { render :show, status: :created, location: @publish }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publishes/1 or /publishes/1.json
  def update
    respond_to do |format|
      if @publish.update(publish_params)
        format.html { redirect_to publish_url(@publish), notice: "Publish was successfully updated." }
        format.json { render :show, status: :ok, location: @publish }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publishes/1 or /publishes/1.json
  def destroy
    @publish.destroy

    respond_to do |format|
      format.html { redirect_to publishes_url, notice: "Publish was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publish
      @publish = Publish.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def publish_params
      params.require(:publish).permit(:title, :content)
    end
end
