include:
  - users.groups
{% if grains['nodename'] == 'db1' %}
  - users.group3
  - users.group1
{% endif %}
{% if grains['nodename'] == 'obsd1' %}
  - users.group3
  - users.group1
{% endif %}
users:
  lookup:
    {% if grains['os_family'] != 'Debian' %}
    adm_group: wheel
    {% endif %}
