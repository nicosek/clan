class CreateSubventionRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :subvention_requests do |t|
      t.references :subvention, foreign_key: true
      t.string :justif_path
      t.string :email
      t.integer :amount_asked

      t.timestamps
    end
  end
end
