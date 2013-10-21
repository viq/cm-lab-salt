{% if grains['nodename'] == 'obsd1' %}
carp_advbase: 1
carp_advskew: 10
{% elif grains['nodename'] == 'obsd2' %}
carp_advbase: 1
carp_advskew: 100
{% endif %}
carp0:
  carp_dev: em1
  carp_pass: ByibalyeiggAn8
  carp_vhid: 1
carp1:
  carp_dev: em2
  carp_pass: Icodafdaks4OcElfEf9
  carp_vhid: 2
