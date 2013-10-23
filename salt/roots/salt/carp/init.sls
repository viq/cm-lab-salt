carp:
  {% for iface, carpid in pillar['carp'].iteritems() %}
  /etc/hostname.{{iface}}:
    file.managed:
      - contents_pillar: carp:{{iface}}:carp_description
  {% endfor %}
