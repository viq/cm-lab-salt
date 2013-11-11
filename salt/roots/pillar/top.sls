base:
  '*':
    - collectd
  'os:OpenBSD':
    - match: grain
    - carp
  'db1 or app1':
    - match: compound
    - wordpress
  'db1 or obsd1':
    - match: compound
    - users
  'app1':
    - users.group1
    - users.group3
