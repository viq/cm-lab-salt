fpm:
  gem.installed:
    - user: root

requirements:
  pkg.installed:
    - pkgs:
      - build-essential
      - ruby1.9.1-dev
    - require_in:
      - gem: fpm
