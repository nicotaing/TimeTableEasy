# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_timeableasy_session',
  :secret      => 'e54be7be1e4f3f55be178c3345b9eb66992ec06440e7de528275332e642877a14763254955d224a7d8f0217652f0d0b47195f2d810bcd560496310083644c996'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
