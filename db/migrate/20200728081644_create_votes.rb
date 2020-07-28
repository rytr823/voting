class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :choice, null: false, foreign_key: true
      t.timestamps
    end
  end
end
