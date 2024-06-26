class ChatsController < ApplicationController
  before_action :set_chat, only: %i[ show edit update destroy ]

  # GET /chats or /chats.json
  def index
    @users_available_to_chat = current_user.followings & current_user.followers
    # @chats = Chat.all
  end

  # GET /chats/1 or /chats/1.json
  def show
    @other_user = @chat.other_user(current_user)
  end

  # GET /chats/new
  def new
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats or /chats.json
  def create
    @chat = Chat.find_by(user_opening_chat_id: current_user.id, user_destination_chat_id: params[:user_id])
    @chat ||= Chat.find_by(user_opening_chat_id: params[:user_id], user_destination_chat_id: current_user.id)
    return redirect_to @chat if @chat.present?

    @chat = Chat.new(user_opening_chat_id: current_user.id, user_destination_chat_id: params[:user_id])
    respond_to do |format|
      if @chat.save
        format.html { redirect_to chat_url(@chat), notice: "Chat was successfully created." }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1 or /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to chat_url(@chat), notice: "Chat was successfully updated." }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1 or /chats/1.json
  def destroy
    @chat.destroy!

    respond_to do |format|
      format.html { redirect_to chats_url, notice: "Chat was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chat_params
      params.require(:chat).permit(:user_opening_chat_id, :user_destination_chat_id)
    end
end
