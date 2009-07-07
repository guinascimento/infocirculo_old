class SetUpFirstAdminUser < ActiveRecord::Migration
  def self.up
		#Be sure to change these settings for your initial admin user
    user = SiteUser.new
		user.login = "admin"
		user.email = "admin@infocirculo.com"
		user.password = "admin"
		user.password_confirmation = "admin"
    user.save(false)
		role = Role.new
		#Admin role name should be "admin" for convenience
		role.name = "admin"
		role.save
		admin_user = SiteUser.find_by_login("admin")
		admin_role = Role.find_by_name("admin")
		admin_user.activated_at = Time.now.utc
		admin_user.roles << admin_role
		admin_user.save(false)

        user = SiteUser.new
		user.login = "guilherme"
        user.last_name = "Nascimento"
        user.name = "Guilherme"
		user.email = "javaplayer@gmail.com"
		user.password = "aaaaaa"
		user.password_confirmation = "aaaaaa"
    user.save(false)
		role = Role.new
		#Admin role name should be "admin" for convenience
		role.name = "admin"
		role.save
		admin_user = SiteUser.find_by_login("guilherme")
		admin_role = Role.find_by_name("admin")
		admin_user.activated_at = Time.now.utc
		admin_user.roles << admin_role
		admin_user.save(false)
  end

  def self.down
		admin_user = User.find_by_login("admin")
		admin_role = Role.find_by_name("admin")
		admin_user.roles = []
    admin_user.save
    admin_user.destroy
		admin_role.destroy
  end
end
