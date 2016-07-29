class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.text :question
      t.string :answer

      t.timestamps null: false
    end
  end
end
