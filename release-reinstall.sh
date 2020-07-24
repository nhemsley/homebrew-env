#!/bin/bash

echo "Pull"
git pull
echo "Push"
git push
echo "Tag"
git tag -d 0.01; git tag 0.01; git push --delete origin 0.01; git push --tags

rm -rf ~/.linuxbrew/etc/brew-env

git -C ~/.linuxbrew/Homebrew/Library/Taps/nhemsley/homebrew-env pull

echo "Reinstalling"
brew reinstall homebrew-env

echo "###############"

cat ~/.linuxbrew/etc/brew-env/presets.yaml

chmod +x ~/.linuxbrew/Cellar/homebrew-env/0.01/bin/brew-env*

