#!/usr/bin/env bash
# ==============================================================================
# 12. TABELLEN-ROUNDTRIP VIA PSQL DURCHFÜHREN
# ==============================================================================
# Erstellt eine Testtabelle, fügt einen Datensatz ein und liest diesen aus
# SQL-Operationen:
#   1. CREATE TABLE demo (id serial primary key, note text);
#   2. INSERT INTO demo (note) VALUES ('connected from the CLOUD 5 lab');
#   3. SELECT * FROM demo;

export PGSSLMODE=require

psql "host=$PG_HOST port=5432 dbname=postgres user=$PG_ADMIN password=$PG_PASS" -c \
  "CREATE TABLE demo (id serial primary key, note text);
   INSERT INTO demo (note) VALUES ('connected from the CLOUD 5 lab');
   SELECT * FROM demo;"
