#!/bin/bash

set -e

git config --global user.name "$1"
git config --global user.email "$2"

git-dch --distribution=stable --debian-branch "$3"
TAG=$(grep -Po -m 1 '\(\K.*?(?=\))' debian/changelog)
git add debian/changelog
git commit -m "Release $TAG"
git-buildpackage --git-tag-only --git-ignore-new --debian-branch "$3"
