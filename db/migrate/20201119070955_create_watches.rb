class CreateWatches < ActiveRecord::Migration[6.0]
  def change
    create_table :watches do |t|
      t.references :user,  foreign_key: true
      t.references :anime, foreign_key: true
      t.timestamps
    end
  end
end
