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
  mysql_database.present:
    - name: {{ salt['pillar.get']('wordpress:db:db_name') }}
wordpress_user:
  mysql_user.present:
    - name: {{ salt['pillar.get']('wordpress:db:db_user') }}
    - host: 192.168.34.102
    - password: {{ salt['pillar.get']('wordpress:db:db_password') }}
wordpress_grants:
  mysql_grants.present:
    - grant: all privileges
    - database: wordpress.*
    - user: {{ salt['pillar.get']('wordpress:db:db_user') }}