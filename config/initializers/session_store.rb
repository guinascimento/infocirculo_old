# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_site_session',
  :secret      => 'ce0642f828bd4430ce1799c9aaf540d6a204bceba426a6369abefe1a310d86dae49b1c92e1948e9ac841b94adfa0bba8e3c51de9a7855d8bb2ced0f5a2bb5904'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
