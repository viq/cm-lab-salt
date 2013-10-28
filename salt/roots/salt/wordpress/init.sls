{% if grains['os'] == 'Debian' %}
wordpress:
  pkg.installed
wordpress_setup:
  cmd.script:
    - name: setup-debian
    - source: salt://wordpress/setup-debian
    - args: -n {{ salt['pillar.get']('wordpress:site:name') }} -u {{ salt['pillar.get']('wordpress:db:db_user') }} -p {{ salt['pillar.get']('wordpress:db:db_password') }} -t {{ salt['pillar.get']('wordpress:site:db_host') }} -e {{ salt['pillar.get']('wordpress:db:db_name') }} {{ salt['pillar.get']('wordpress:site:fqdn') }}
    - unless: test -f /etc/wordpress/config-{{ salt['pillar.get']('wordpress:site:name') }}.php
    - require:
      - pkg: wordpress
{% endif %}