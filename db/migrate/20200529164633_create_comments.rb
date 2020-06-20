class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :text

      t.timestamps
      t.belongs_to :article, foreign_key: true
    end
  end
end
