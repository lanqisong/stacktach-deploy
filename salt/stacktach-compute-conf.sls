/usr/bin/openstack-config:
  file.managed:
    - source: salt://scripts/openstack-config
    - user: root
    - group: root
    - mode: 0755
stacktach-compute-conf:
  cmd.script:
    - source: salt://stacktach/scripts/stacktach-compute-conf.sh
    - user: root
    - group: root
    - shell: /bin/bash
    - require:
      - file: /usr/bin/openstack-config
