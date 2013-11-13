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
 
{% if 'pub_ssh_keys' in args %}
{{ user }}_key.pub:
  ssh_auth:
    - present
    - user: {{ user }}
    - comment: {{ args['fullname'] }}
    - names: {{ args['pub_ssh_keys'] }}
{% endif %}
{% if 'pub_ssh_keys_absent' in args %}
{{ user }}_key_gone.pub:
  ssh_auth:
    - absent
    - user: {{ user }}
    - names: {{ args['pub_ssh_keys_absent'] }}
{% endif %}
{% endfor %}
