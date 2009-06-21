# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_quiz_session',
  :secret      => '51e3b9398213288b6372db912464c788eecf67a29c08babe4704f0c8494fe7052a9337413ed373cdfa3679b0aeedaaa5728b53cf25b024e9875efad37d67e56c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
