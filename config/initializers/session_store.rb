# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_meruna_session',
  :secret      => 'f724e42b3b9a27445b0104907a2f5f1f8f90232a08b12d208ed7bd985f726b4a1338995fa9fd6136a89b9f1de5f7b34e2924c83ce906e050e1beffba90a95ed7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
