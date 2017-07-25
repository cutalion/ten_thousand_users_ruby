How to run the code:
====================


1. `bundle install`

2. create DB in postgres

3. Run migrations
  `sequel -t -m migrations postgres://localhost/ten_thousand_users_ruby`

4. run Puma
  `puma -w 4 -t 4:4` (change according to your CPU)

5. run ab
  `ab -n 1000 -c 100 http://localhost:9292/`



Results on localhost:
=====================

*Sequel*

```
Concurrency Level:      100
Time taken for tests:   3.171 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      99968000 bytes
HTML transferred:       99894000 bytes
Requests per second:    315.32 [#/sec] (mean)
Time per request:       317.141 [ms] (mean)
Time per request:       3.171 [ms] (mean, across all concurrent requests)
Transfer rate:          30782.86 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.6      0       3
Processing:    10  297 185.1    299     657
Waiting:       10  296 185.1    299     656
Total:         10  298 185.2    300     657
```


*ActiveRecord*

```
Concurrency Level:      100
Time taken for tests:   29.534 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      99968000 bytes
HTML transferred:       99894000 bytes
Requests per second:    33.86 [#/sec] (mean)
Time per request:       2953.365 [ms] (mean)
Time per request:       29.534 [ms] (mean, across all concurrent requests)
Transfer rate:          3305.55 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   1.3      0       7
Processing:    97 2776 1516.1   2959    5802
Waiting:       91 2750 1513.9   2933    5791
Total:         97 2777 1515.8   2959    5802
```
