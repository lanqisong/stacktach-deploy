create-db:
  cmd.script:
    - source: salt://stacktach/scripts/create-db.sh
    - user: root
    - group: root
    - shell: /bin/bash
    - template: jinja
