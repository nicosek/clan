class AddPhototoToSubventions < ActiveRecord::Migration[5.2]
  def change
    add_column :subventions, :photo, :string
  end
end
