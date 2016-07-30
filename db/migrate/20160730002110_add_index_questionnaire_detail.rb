class AddIndexQuestionnaireDetail < ActiveRecord::Migration
  def change
    add_index :questionnairedetails, :questionnaire_id
  end
end
