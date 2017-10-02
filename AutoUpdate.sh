#!/bin/bash
echo ===GIT AUTO-UPDATE, `date`===
cd /data/finnes
git add -A
git commit -m "Auto-Update `date`"
git push origin master
