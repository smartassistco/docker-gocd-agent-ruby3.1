# GoCD Agent with Ruby 3.1 Docker Image

[![dockeri.co](https://dockeri.co/image/smartassist/gocd-agent-ruby3.1)](https://hub.docker.com/r/smartassist/gocd-agent-ruby3.1)

[![Docker Build Status](https://github.com/smartassistco/docker-gocd-agent-ruby3.1/actions/workflows/docker-image.yml/badge.svg)](https://github.com/smartassistco/docker-gocd-agent-ruby3.1/actions/workflows/docker-image.yml)

[GoCD Agent on Debian 11](https://hub.docker.com/r/gocd/gocd-agent-debian-10) with the latest version of Ruby 3.1 added
to it.

## Usage

- To use in your docker-compose.yml:

```yaml
services:
  gocd-agent-ruby3.1:
    image: smartassist/gocd-agent-ruby3.1:v21.4.0
    restart: unless-stopped
    env_file: .env
```

- To modify further, reference in your Dockerfile:

```dockerfile
FROM smartassist/gocd-agent-ruby3.1:v21.4.0
```

## Contents

- [GoCD's official Debian 11 agent's Dockerfile](https://hub.docker.com/r/gocd/gocd-agent-debian-11)
- [Docker's official Ruby 3.1 Dockerfile](https://github.com/docker-library/ruby/raw/master/3.1/bullseye/Dockerfile)
- [Buildpack Dependencies](https://github.com/docker-library/buildpack-deps/raw/master/debian/bullseye/Dockerfile)

## Versions

| Runtime    | Version              |
|------------|----------------------|
| OS         | Debian 11 (Bullseye) |
| GoCD agent | 21.4.0               |
| Ruby       | 3.1.0                |
| Node       | 17.4.0               |

## Building

- Update versions in `generate.sh`
- Run `bash generate.sh`
