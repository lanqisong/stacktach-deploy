start-worker:
  cmd.script:
    - source: salt://stacktach/scripts/start-worker.sh
    - user: root
    - group: root
    - shell: /bin/bash
