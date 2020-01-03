class MessagesController < ApplicationController

  def create
    params.permit!
    recipient_id = User.find_by(name: params[:recipient]).id
    message = Message.create(note_id: params[:note_id], sender_id: params[:sender_id], recipient_id: recipient_id)
    render json: MessageSerializer.new(message).to_serialized_json
  end

  def destroy
    message = Message.find(params[:id])
    message.delete
  end

  def show
    message = Message.find(params[:id])
    render json: message
  end

  def update
    message = Message.find(params[:id])
    params.permit!
    message.update(params[:message])
    message.save
    render json: MessageSerializer.new(message).to_serialized_json
  end

end
