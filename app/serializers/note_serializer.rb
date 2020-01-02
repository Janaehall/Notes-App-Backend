class NoteSerializer < ActiveModel::Serializer
  has_many :tags, through: :note_tags
  belongs_to :user

  def initialize(note_obj)
    @note = note_obj
  end
  
  def to_serialized_json
    @note.to_json(:include => {
      :tags => {:only => [:name]}
    },
    :except => [:created_at, :updated_at])
  end
end