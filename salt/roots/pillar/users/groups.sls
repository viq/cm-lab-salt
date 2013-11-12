groups:
{% if grains['os'] == 'OpenBSD' %}
  group1: ['wheel', 'dialer', 'wsrc', 'www']  
  group3:
    - 3group
    - authpf
    - dialer
{% elif grains['os'] == 'Debian' %}
  group1: ['1group']
  group3: ['sudo']
{% else %}
  group1: ['1group']
  group3: ['3group']
{% endif %}
