#!/bin/bash -xe
for branch in $(git branch | grep -v master); do
	git co "${branch}";
	git merge master;
	git push origin;
done
