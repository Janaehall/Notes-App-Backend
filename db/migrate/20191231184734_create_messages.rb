class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :note_id
      t.boolean :seen, default: false

      t.timestamps
    end
  end
end
