class CreateThoughtrecords < ActiveRecord::Migration
  def change
    create_table :thoughtrecords do |t|
      t.text :situation
      t.text :feelings
      t.text :unhelpfulthoughts
      t.text :supportingfacts
      t.text :disprovingfacts
      t.text :altperspective
      t.text :outcome

      t.timestamps
    end
  end
end
