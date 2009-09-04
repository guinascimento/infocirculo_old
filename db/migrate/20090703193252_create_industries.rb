class CreateIndustries < ActiveRecord::Migration
  def self.up
    create_table "industries", :force => true do |t|
      t.column :name,  :string
      t.timestamps
    end
  end

  def self.down
    drop_table "industries"
  end
end
