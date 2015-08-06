#!/usr/bin/env bash

# Ensure script is run as root, so we can claim ownership of state folder

if [ $UID -ne 0 ]; then
  echo "Script must be run as root"
  exit 1
fi

# Get location of this script

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Get logged in username

USERNAME=$(who am i | awk '{print $1}')

# Set common paths
PLUGINS_ENDPOINT=http://updates.jenkins-ci.org/latest/
DATA=$DIR/state

# Create folder for plugins

mkdir -p $DATA/plugins

# Make sure we own this directory

chown -R "$USERNAME" $DIR

# Download latest plugins

(cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/credentials.hpi)
(cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/ssh-credentials.hpi)
(cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/plain-credentials.hpi)
(cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/ssh-agent.hpi)
(cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/git-client.hpi)
(cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/git.hpi)
(cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/github.hpi)
(cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/github-api.hpi)
(cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/ghprb.hpi)
(cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/github-oauth.hpi)
(cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/scm-api.hpi)
(cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/postbuild-task.hpi)
