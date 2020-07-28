class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.string :text, null: false
      t.references :content, null: false
      t.timestamps
    end
  end
end
