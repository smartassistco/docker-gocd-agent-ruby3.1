#!/bin/bash

GOCD_AGENT_VERSION=21.4.0
RUBY_VERSION=3.1
NODE_VERSION=17

echo "Creating temp directory"

mkdir -p tmp

echo "Downloading source files"

wget -q -O tmp/curl.dockerfile "https://github.com/docker-library/buildpack-deps/raw/master/debian/bullseye/curl/Dockerfile"
wget -q -O tmp/scm.dockerfile "https://github.com/docker-library/buildpack-deps/raw/master/debian/bullseye/scm/Dockerfile"
wget -q -O tmp/buildpack-deps.dockerfile "https://github.com/docker-library/buildpack-deps/raw/master/debian/bullseye/Dockerfile"
wget -q -O tmp/ruby.dockerfile "https://github.com/docker-library/ruby/raw/master/$RUBY_VERSION/bullseye/Dockerfile"
wget -q -O tmp/node.dockerfile "https://github.com/nodejs/docker-node/raw/main/$NODE_VERSION/bullseye/Dockerfile"

echo "Creating Dockerfile"

# Creating ruby.dockerfile
{
  echo -e "## DO NOT MODIFY DIRECTLY. GENERATED WITH generate.sh ##\\n"

  echo "FROM gocd/gocd-agent-debian-10:v$GOCD_AGENT_VERSION"

  echo -e "\\n# Become root"
  echo -e "USER root\\n"

  echo -e "\\n#\\n# Buildpack Deps\\n#\\n"
  sed "/^FROM.*/d" tmp/curl.dockerfile
  sed "/^FROM.*/d" tmp/scm.dockerfile
  sed "/^FROM.*/d" tmp/buildpack-deps.dockerfile

  echo -e "\\n#\\n# Ruby\\n#\\n"
  sed "/^FROM.*/d; /^CMD.*/d" tmp/ruby.dockerfile

  echo -e "\\n#\\n# Node\\n#\\n"
  sed "/^FROM.*/d; /^CMD.*/d; /^COPY docker-entrypoint.sh.*/d; /^ENTRYPOINT.*/d; s/id[[:space:]]1000/id 1001/g" tmp/node.dockerfile

  echo -e "\\n# Change user back to go"
  echo "USER go"

} >Dockerfile

echo "Dockerfile generated"
