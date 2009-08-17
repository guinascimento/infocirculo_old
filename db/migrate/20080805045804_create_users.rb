class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :user_type,		           :string
      t.column :login,                     :string, :limit => 40
      t.column :name,                      :string, :limit => 100, :default => '', :null => true
      t.column :email,                     :string, :limit => 100
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime
      t.column :activation_code,           :string, :limit => 40
      t.column :activated_at,              :datetime
      t.column :password_reset_code,       :string, :limit => 40
      t.column :enabled,                   :boolean, :default => true
      t.column :identity_url,			   :string
      t.column :invitation_id,			   :integer
      t.column :invitation_limit, 		   :integer
      t.column :cep,                       :string, :limit => 8
      t.column :professional_description,  :string
      t.column :public_profile,            :integer
      t.column :subdomain,                 :string
      t.references :industry
    end
    add_index :users,  :login, :unique => true
    add_column :users, :last_name, :string

    add_column :users, :avatar_file_name,    :string
    add_column :users, :avatar_content_type, :string
    add_column :users, :avatar_file_size,    :integer
    add_column :users, :avatar_updated_at,   :datetime
  end

  def self.down
    drop_table "users"
  end
end
