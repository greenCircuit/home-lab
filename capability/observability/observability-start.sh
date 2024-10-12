#!/bin/sh

podmna-compose -f fluent-bit-compose.yaml -f grafana-compose.yaml -f open-search-compose.yaml
