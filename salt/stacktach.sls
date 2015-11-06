/opt/stacktach/etc/stacktach_config.sh:
  file.managed:
    - source: salt://stacktach/templates/stacktach_config.sh
    - user: root
    - group: root
    - template: jinja
/opt/stacktach/etc/stacktach_worker_config.json:
  file.managed:
    - source: salt://stacktach/templates/stacktach_worker_config.json
    - user: root
    - group: root
    - template: jinja
/opt/stacktach/wsgi.py:
  file.managed:
    - source: salt://stacktach/templates/wsgi.py
    - user: root
    - group: root
    - template: jinja
/etc/apache2/conf-available/stacktach.conf:
  file.managed:
    - source: salt://stacktach/templates/stacktach_apache.conf
    - user: root
    - group: root
    - mode: 644
stacktach-deploy:
  cmd.script:
    - source: salt://stacktach/scripts/stacktach-deploy.sh
    - user: root
    - group: root
    - shell: /bin/bash
    - template: jinja
