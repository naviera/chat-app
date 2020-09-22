class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :alias
      t.string :content
      t.bigint :sala_id

      t.timestamps
    end
  end
end
