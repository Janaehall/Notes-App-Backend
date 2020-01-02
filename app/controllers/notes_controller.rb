class NotesController < ApplicationController
  def index
    render json: Note.all
  end

  def show
    note = Note.find(params[:id])
    render json: note
  end

  def destroy
    note = Note.find(params[:id])
    note.delete
  end

  def update
    p params
    note = Note.find(params[:id])
    note.title = params[:title]
    note.content = params[:content]
    note.save
  end

  def create
    tagsArray = []
    # params[:tags].each{|tag| tagsArray.push(Tag.find_or_create_by(name: tag))}
    note = Note.create(title: params[:title], content: params[:content], user_id: params[:user_id], tags: tagsArray)
    render json: NoteSerializer.new(note).to_serialized_json
  end

end
