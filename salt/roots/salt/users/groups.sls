{% for group, args in pillar['groups'].iteritems() %}
{{ args.pop() }}:
  group:
    - present
{% endfor %}
