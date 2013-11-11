{% if grains['nodename'] == 'saltmaster' %}
include:
  - collectd.recv
{% else %}
include:
  - collectd.agent
{% endif %}
