#! /bin/bash
salt api1 state.sls stacktach-deploy
salt api* state.sls stacktach-controller-conf
salt compute* state.sls stachtach-compute-conf
