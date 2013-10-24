/etc/pf.conf:
  file.managed:
    - source: salt://pf/pf.conf
    - mode: '600'
  cmd.wait:
    - name: pfctl -f /etc/pf.conf
    - cwd: /etc
    - watch:
      - file: /etc/pf.conf
    - onlyif: pfctl -f /etc/pf.conf -n