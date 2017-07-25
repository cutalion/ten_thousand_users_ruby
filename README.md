To run the code:

1. `bundle install`

2. create DB in postgres

3. Run migrations
  `sequel -t -m migrations postgres://localhost/ten_thousand_users_ruby`

4. run Puma
  `puma -w 4 -t 4:4` (change according to your CPU)

5. run ab
  `ab -n 1000 -c 100 http://localhost:9292/`

