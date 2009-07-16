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
    change_table :experiences do |t|
      add_column :experiences, :working, :integer
    end 
  end

  def self.down
    drop_table :experiences
  end
end
