mysql-server:
  pkg.installed:
    - pkgs:
      - mysql-server
      - python-mysqldb
mysql:
  service:
    - running
    - enable: True
    - watch:
      - pkg: mysql-server
wordpress:
  mysql_database.present
wordpress_user:
  mysql_user.present:
    - name: wordpress
    - host: 192.168.34.102
    - password: UgDefijTiesumWashsid
wordpress_grants:
  mysql_grants.present:
    - grant: all privileges
    - database: wordpress.*
    - user: wordpress