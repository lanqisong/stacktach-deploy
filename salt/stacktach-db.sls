create-db:
  cmd.script:
    - source: salt://stacktach/scripts/db-create.sh
    - user: root
    - group: root
    - shell: /bin/bash
    - template: jinja
