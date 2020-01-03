class UserSerializer < ActiveModel::Serializer
  has_many :notes
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'
  
  def initialize(user_obj)
    @user = user_obj
  end

  def to_serialized_json
    @user.to_json(:include => {
      :notes => {include: [:tags]},
      :received_messages => {include: [note: {include: {tags: {only: [:name]}}, except: [:created_at, :updated_at]}, sender: {only: [:name, :id]}], except: [:created_at, :updated_at]}
    },
    :except => [:created_at, :updated_at])
  end
end