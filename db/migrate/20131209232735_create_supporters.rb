class CreateSupporters < ActiveRecord::Migration
  def change
    create_table :supporters do |t|
      t.string :name
      t.string :email
      t.float :contribution
      t.string :note
      t.timestamps
    end
  end
end
