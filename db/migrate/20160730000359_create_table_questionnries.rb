class CreateTableQuestionnries < ActiveRecord::Migration
  def change

    create_table :questionnaires do |t|
      t.string :title
      t.timestamps null: false
    end
  end
end
