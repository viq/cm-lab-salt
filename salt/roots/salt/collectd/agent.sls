collectd:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - require:
      - pkg: collectd
      - file: collectd.conf
    - watch:
      - pkg: collectd
      - file: collectd.conf

collectd.conf:
  file.managed:
    - name: {{ pillar['collectd']['conf'] }}
    - source: salt://collectd/collectd-agent.conf
    - require:
      - pkg: collectd

{% if grains['os'] == 'OpenBSD' %}
collectd-init:
  file.managed:
    - name: /etc/rc.d/collectd
    - source: salt://collectd/collectd-init
    - mode: 555
    - require:
      - pkg: collectd
    - require_in:
      - service: collectd
{% endif %}
