class CreateContactsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :pfp_url
      t.string :f_name
      t.string :l_name
      t.integer :phone_number
    end
  end
end
