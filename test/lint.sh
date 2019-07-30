#!/bin/bash

yamllint .
ansible-lint -v bootstrap/bootstrap.yaml
