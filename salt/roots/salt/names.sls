append-file:
  cmd:
    - cwd: /tmp
    - names:
    {% for user, name in pillar['names'].iteritems() %}
      - echo {{ user }} {{ name['number'] }}  {{ name['dir'] }} >> logfile.txt
    {% endfor %}
    - run
