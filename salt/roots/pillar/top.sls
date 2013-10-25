base:
  'os:OpenBSD':
    - match: grain
    - carp
    - test
  'db1 or app1':
    - match: compound
    - wordpress