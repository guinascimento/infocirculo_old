class CreateEducations < ActiveRecord::Migration
  def self.up
    create_table :educations do |t|
      t.column :country, :integer
      t.column :school_name, :string
      t.column :degree, :int
      t.column :start, :datetime
      t.column :end, :datetime
      t.column :activities, :string
      t.column :additional_notes, :string

      t.references :curriculum
      t.timestamps
    end
  end

  def self.down
    drop_table :educations
  end
end
