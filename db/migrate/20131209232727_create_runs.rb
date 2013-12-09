class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :admin_url
      t.string :public_url
      t.datetime :time
      t.string :admin_name
      t.string :admin_email
      t.string :square_cash_email
      t.string :venmo_id
      t.string :title
      t.string :description
      t.float :min_amount
      t.integer :total_contributors
      t.float :total_contributions
      t.timestamps
    end
  end
end
