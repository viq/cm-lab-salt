{% for name, list in pillar['groups'].iteritems() %}
{% for groupname in list %}
{{ groupname }}:
  group:
    - present
{% endfor %}
{% endfor %}