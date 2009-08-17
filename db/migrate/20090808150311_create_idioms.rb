class CreateIdioms < ActiveRecord::Migration
  def self.up
    create_table :idioms do |t|
      t.column :degree, :integer, :limit => 3
      t.column :name, :string
      t.references :curriculum
      t.timestamps
    end
  end

  def self.down
    drop_table :idioms
  end
end
