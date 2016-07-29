class AddQuestionnarieNumber < ActiveRecord::Migration
  def change
    add_column :questionnaires, :questionnairesnumber, :integer
  end
end
