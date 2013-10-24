{% for iface, carpid in pillar['carp'].iteritems() %}
/etc/hostname.{{iface}}:
  file.managed:
    - contents: inet {{ carpid['carp_ip'] }} {{ carpid['carp_mask'] }} NONE vhid {{ carpid['carp_vhid'] }} advbase {{ carpid['carp_advbase'] }} advskew {{ carpid['carp_advskew'] }} pass {{ carpid['carp_pass'] }}
{% endfor %}