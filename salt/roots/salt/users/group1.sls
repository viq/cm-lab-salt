{% for user, args in pillar['group1'].iteritems() %}
{{ user }}:
#  group:
#    - present
  user.present:
    - home: {{ args['home'] }}
{% if 'password' in args %}
    - password: {{ args['password'] }}
{% if 'enforce_password' in args %}
    - enforce_password: {{ args['enforce_password'] }}
{% endif %}
{% endif %}
    - fullname: {{ args['fullname'] }}
    - groups: {{ salt['pillar.get']('groups:group1') }}
#    - require:
#      - group: {{ user }}
 
{% if 'key.pub' in args and args['key.pub'] == True %}
{{ user }}_key.pub:
  ssh_auth:
    - present
    - user: {{ user }}
    - source: salt://users/{{ user }}/keys/key.pub
{% endif %}
{% endfor %}
