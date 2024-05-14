class ChatMessagesController < ApplicationController
  before_action :set_chat_message, only: %i[ show edit update destroy ]

  # GET /chat_messages or /chat_messages.json
  def index
    @chat_messages = ChatMessage.all
  end

  # GET /chat_messages/1 or /chat_messages/1.json
  def show
  end

  # GET /chat_messages/new
  def new
    @chat_message = ChatMessage.new
  end

  # GET /chat_messages/1/edit
  def edit
  end

  # POST /chat_messages or /chat_messages.json
  def create
    @chat_message = ChatMessage.new(chat_message_params)
    justify_position = @chat_message.user_send_message.email == current_user.email ? 'justify-end' : ''
    text_align = @chat_message.user_send_message.email == current_user.email ? 'text-align: right;' : ''

    respond_to do |format|
      if @chat_message.save
        Turbo::StreamsChannel.broadcast_action_to(
          "chat_messages_channel_#{@chat_message.chat_id}",
          action: :prepend,
          target: 'all_messages',
          partial: 'chat_messages/chat_message',
          locals: {
            chat_message: @chat_message,
            justify_position: justify_position,
            text_align: text_align,
            batata: current_user.id
          }
        )
        format.turbo_stream {}
        format.html { redirect_to @chat_message.chat, notice: "Chat message was successfully created." }
        format.json { render :show, status: :created, location: @chat_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chat_messages/1 or /chat_messages/1.json
  def update
    respond_to do |format|
      if @chat_message.update(chat_message_params)
        format.html { redirect_to chat_message_url(@chat_message), notice: "Chat message was successfully updated." }
        format.json { render :show, status: :ok, location: @chat_message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chat_messages/1 or /chat_messages/1.json
  def destroy
    @chat_message.destroy!

    respond_to do |format|
      format.html { redirect_to chat_messages_url, notice: "Chat message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def load_more_messages
    @number_messages_loaded = params[:number_messages_loaded].to_i
    @chat_id = params[:chat_id]
    @chat = Chat.find(@chat_id)
    @chat_messages = @chat.chat_messages.order(created_at: :desc).offset(@number_messages_loaded).limit(3)
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_message
      @chat_message = ChatMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chat_message_params
      params.require(:chat_message).permit(:chat_id, :message).to_h.merge(user_send_message_id: current_user.id)
    end
end
