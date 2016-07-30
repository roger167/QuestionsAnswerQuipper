class CreateQuestionnairedetails < ActiveRecord::Migration
  def change
    create_table :questionnairedetails do |t|
      t.string :answerUser
      t.string :eval
      t.integer :idquestion
      t.integer :questionnaire_id

      t.timestamps null: false
    end
  end
end
