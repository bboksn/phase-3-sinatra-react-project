class CreateRelationshipCategoryTable < ActiveRecord::Migration[6.1]
  def change
    create_table :relationship_categories do |t|
      t.string :relation
      t.string :desc
    end 
  end
end
