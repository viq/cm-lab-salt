base:
  '*':
    - base
    - timezone
  'os:OpenBSD':
    - match: grain
    - router
    - carp
    - pf
