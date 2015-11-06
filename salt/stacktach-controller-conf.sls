stacktach-controller-conf:
  cmd.script:
    - source: salt://stacktach/scripts/stacktach-controller-conf.sh
    - user: root
    - group: root
    - shell: /bin/bash
