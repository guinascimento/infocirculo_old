class CreateCurriculums < ActiveRecord::Migration
  def self.up
    create_table :curriculums do |t|
      t.column :summary, :string
      t.column :phone, :string
      t.column :im, :string
      t.column :im_type, :integer
      t.column :address, :string
      t.column :birthday, :string
      t.column :maritial_status, :integer, :limit => 3

      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :curriculums
  end
end
