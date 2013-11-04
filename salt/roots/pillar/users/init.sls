{% if grains['nodename'] == 'db1' %}
include:
  - users.group3
  - users.group1
{% endif %}
