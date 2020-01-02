class MessagesController < ApplicationController

  def create
    params.permit!
    recipient_id = User.find_by(name: params[:recipient]).id
    Message.create(note_id: params[:note_id], sender_id: params[:sender_id], recipient_id: recipient_id)
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
    p 'ksldjflaskjfl;skdjlf;as'
    # p message
    params.permit!
    message.update(params[:message])
    p message
    p message.errors
    message.save
    render json: MessageSerializer.new(message).to_serialized_json
  end

end
