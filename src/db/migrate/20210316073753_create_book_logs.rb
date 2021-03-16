class CreateBookLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :book_logs do |t|
      t.string :title
      t.string :author, limit: 50
      t.string :status, limit: 10
      t.integer :score, limit: 1
      t.text :summary, limit: 1000

      t.timestamps
    end
  end
end
