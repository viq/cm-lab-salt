base:
  '*':
    - base
    - timezone
  'os:OpenBSD':
    - match: grain
    - router
    - carp
    - pf
  'os:Debian':
    - match: grain
    - packages
  'db1':
    - mysql
    - users
  'app1':
    - wordpress
  'obsd1':
    - users
  'saltmaster':
    - gems
