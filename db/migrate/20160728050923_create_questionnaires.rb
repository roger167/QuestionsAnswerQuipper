class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :answer
      t.string :eval
      t.integer :idquestion

      t.timestamps
    end
  end
end
