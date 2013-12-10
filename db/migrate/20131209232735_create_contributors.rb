class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :name
      t.string :email
      t.float :contribution
      t.string :note
      t.references :thing
      t.timestamps
    end
  end
end
