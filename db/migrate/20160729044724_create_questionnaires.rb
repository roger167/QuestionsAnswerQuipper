class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :answerUser
      t.string :eval
      t.integer :idquestion

      t.timestamps null: false
    end
  end
end
