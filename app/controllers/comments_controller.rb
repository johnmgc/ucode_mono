class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :auth_user

  # GET /comments or /comments.json
  def index
    @comments = Comment.where("user_id = #{current_user.id}").page params[:page]
    @publish = Publish.where("id = #{@comments.first.id}").page params[:page]
  end

  # GET /comments/1 or /comments/1.json
  def show
    @publicacion = Publish.where("id = #{@comment.id}").page params[:page]
    @publish = Publish.where("id = #{@comment.id}").page params[:page]
  end

  # GET /comments/new
  def new
    @publicacion = Publish.where("id = #{params[:format]}")
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.publish_id = comment_params[:publish_id]
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to comment_url(@comment), notice: "El comentario fue creado con éxito." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "El comentario ha sido eliminado." }
      format.json { head :no_content }
    end
  end

  private 

  def auth_user
    if !user_signed_in?
        redirect_to root_path
        flash[:alert] = "Debes iniciar Sesion"
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      #  binding.break
      params.require(:comment).permit(:commenter, :body, :publish_id)
    end
end

