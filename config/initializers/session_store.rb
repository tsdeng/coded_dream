# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_coded_dream_session',
  :secret      => '5a5b8543c5cc82a86e58f2362dfe58ebf6be7da25443f4fd86ca120f7903bb66e660e17b70183c9a8209c5a283b02023e715f867a6cddaaceb6a8c5297292f6c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
