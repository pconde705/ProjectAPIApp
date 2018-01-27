class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :page_url
      t.string :tag
      t.string :content

      t.timestamps
    end
  end
end
