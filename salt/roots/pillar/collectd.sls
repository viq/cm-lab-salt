collectd:
  user: 'collectd'
  password: 'collectd'
  {% if grains['os'] == 'OpenBSD' %}
  conf: /etc/collectd.conf
  {% else %}
  conf: /etc/collectd/collectd.conf
  {% endif %}
