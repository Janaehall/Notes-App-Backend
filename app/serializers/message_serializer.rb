class MessageSerializer < ActiveModel::Serializer
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'
  belongs_to :note

  def initialize(message_obj)
    @message = message_obj
  end
  
  def to_serialized_json
    @user.to_json(:include => {
      :note => {include: [tags: {only: [:name]}], except: [:created_at, :updated_at]}
    },
    :except => [:created_at, :updated_at])
  end
end