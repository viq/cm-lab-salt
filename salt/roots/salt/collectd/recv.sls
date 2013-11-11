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
    - source: salt://collectd/collectd-recv.conf
    - require:
      - pkg: collectd

collectd.passwd:
  file.managed:
    - name: /etc/collectd/passwd
    - source: salt://collectd/collectd-passwd
    - require:
      - file: collectd.conf
