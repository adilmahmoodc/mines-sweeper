class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :email
      t.json :mine

      t.timestamps
    end
  end
end
