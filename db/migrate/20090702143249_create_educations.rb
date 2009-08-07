class CreateEducations < ActiveRecord::Migration
  def self.up
    create_table :educations do |t|
      t.column :school_name, :string
      t.column :degree, :integer, :limit => 11
      t.column :start, :datetime
      t.column :end, :datetime
      t.column :activities, :string
      t.column :additional_notes, :string
      t.references :curriculum
      t.references :country
      t.timestamps
    end
    change_table :experiences do |t|
      add_column :educations, :studing, :integer
    end 
  end

  def self.down
    drop_table :educations
  end
end
