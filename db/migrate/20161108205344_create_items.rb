class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :urgency
      t.boolean :complete
      t.belongs_to :list

      t.timestamps
    end
  end
end
