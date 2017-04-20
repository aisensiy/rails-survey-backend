class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :sub_title
      t.text :questions
      t.boolean :publish_results, default: false
      t.boolean :receive_results, default: false

      t.timestamps
    end
  end
end
