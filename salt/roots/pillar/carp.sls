#carp:
#  carp0: '192.168.33.33'
#  carp1: '192.168.34.34'
carp:
  carp0:
    'carp_dev': 'em1'
    'carp_ip': '192.168.33.33'
    'carp_mask': '255.255.255.0'
    'carp_pass': 'ByibalyeiggAn8'
    'carp_vhid': 1
    'carp_description': 'external carp'
    {% if grains['nodename'] == 'obsd1' %}
    'carp_advbase': 1
    'carp_advskew': 10
    {% elif grains['nodename'] == 'obsd2' %}
    'carp_advbase': 1
    'carp_advskew': 100
    {% endif %}
  carp1:
    'carp_dev': 'em2'
    'carp_ip': '192.168.34.34'
    'carp_mask': '255.255.255.0'
    'carp_pass': 'Icodafdaks4OcElfEf9'
    'carp_vhid': 2
    'carp_description': 'internal carp'
    {% if grains['nodename'] == 'obsd1' %}
    'carp_advbase': 1
    'carp_advskew': 10
    {% elif grains['nodename'] == 'obsd2' %}
    'carp_advbase': 1
    'carp_advskew': 100
    {% endif %}
#{% if grains['nodename'] == 'obsd1' %}
#carp_advbase: 1
#carp_advskew: 10
#{% elif grains['nodename'] == 'obsd2' %}
#carp_advbase: 1
#carp_advskew: 100
#{% endif %}
#carp0:
#  carp_dev: em1
#  carp_pass: ByibalyeiggAn8
#  carp_vhid: 1
#carp1:
#  carp_dev: em2
#  carp_pass: Icodafdaks4OcElfEf9
#  carp_vhid: 2
