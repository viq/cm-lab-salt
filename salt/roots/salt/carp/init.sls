{% for iface, carpid in pillar['carp'].iteritems() %}
/etc/hostname.{{iface}}:
  file.managed:
    - source: salt://carp/hostname.carp
    - template: jinja
    - context:
      carp_dev: {{ carpid['carp_dev'] }}
      carp_ip: {{ carpid['carp_ip'] }}
      carp_mask: {{ carpid['carp_mask'] }}
      carp_pass: {{ carpid['carp_pass'] }}
      carp_vhid: {{ carpid['carp_vhid'] }}
      carp_description: {{ carpid['carp_description'] }}
      carp_advbase: {{ carpid['carp_advbase'] }}
      carp_advskew: {{ carpid['carp_advskew'] }}
{% endfor %}