#! /bin/bash
salt db1 state.sls stacktach-db
salt api2 state.sls stacktach
salt '*api*' state.sls stacktach-controller-conf
salt '*compute*' state.sls stacktach-compute-conf
