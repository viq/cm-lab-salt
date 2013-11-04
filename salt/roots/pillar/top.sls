base:
  'os:OpenBSD':
    - match: grain
    - carp
    - test
  'db1 or app1':
    - match: compound
    - wordpress
  'db1':
    - users
  'app1':
    - users.group1
    - users.group3