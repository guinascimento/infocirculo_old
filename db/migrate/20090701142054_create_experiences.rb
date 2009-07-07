class CreateExperiences < ActiveRecord::Migration
  def self.up
    create_table :experiences do |t|
      t.column :company_name, :string
      t.column :title, :string
      t.column :start, :datetime
      t.column :end, :datetime
      t.column :description, :string

      t.references :curriculum
      t.timestamps
    end
  end

  def self.down
    drop_table :experiences
  end
end
