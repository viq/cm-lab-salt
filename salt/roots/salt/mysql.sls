mysql-server:
  pkg.installed
mysql:
  service:
    - running
    - enable: True
    - watch:
      - pkg: mysql-server