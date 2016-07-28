class CreateQuestionsAndAnwers < ActiveRecord::Migration
  def change
    create_table :questions_and_anwers do |t|
      t.text :question
      t.string :answer

      t.timestamps
    end
  end
end
