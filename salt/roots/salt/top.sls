base:
  '*':
    - base
  'os:OpenBSD':
    - match: grain
    - router
    - carp
    - pf
