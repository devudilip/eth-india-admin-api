class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :address
      t.boolean :verified
      t.boolean :minted

      t.timestamps
    end
  end
end
