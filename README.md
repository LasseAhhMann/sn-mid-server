# Docker ServiceNow MID Server

This is a Dockerfile to set up "ServiceNow MID Server".
The server is based on Alpine Linux.
Only ServiceNow version from New York release and onwards are supported.

## Build from docker file

```
git clone https://github.com/LasseAhhMann/sn-mid-server.git
cd sn-mid-server
docker build -t sn-mid-server .
```

## Get started right away

```bash
$ docker run -d --name sn-mid-server \
  -e 'SN_INSTALL_URL=https://install.service-now.com/glide/distribution/builds/package/mid/2020/03/31/mid.orlando-12-11-2019__patch2-03-18-2020_03-31-2020_1417.linux.x86-64.zip' \
  -e 'SN_URL=https://dev00000.service-now.com' \
  -e 'SN_USER=username' \
  -e 'SN_PASSWD=userpassword' \
  -e 'SN_MID_NAME=sn-mid-server' \
  lassekh/sn-mid-server:latest
```

or using Docker Compose:

```yaml
version: '3'
services:
  midserver:
    container_name: sn-midserver
    image: andrekosak/sn-midserver:kingston
    network_mode: host
    environment:
      - SN_INSTALL_URL=https://install.service-now.com/glide/distribution/builds/package/mid/2020/03/31/mid.orlando-12-11-2019__patch2-03-18-2020_03-31-2020_1417.linux.x86-64.zip
      - SN_URL=https://dev00000.service-now.com
      - SN_USER=username
      - SN_PASSWD=password
      - SN_MID_NAME=my-mid-server
```

# Persisting logs

```bash
$ docker run -d --name sn-mid-server \
  -e 'SN_INSTALL_URL=https://install.service-now.com/glide/distribution/builds/package/mid/2020/03/31/mid.orlando-12-11-2019__patch2-03-18-2020_03-31-2020_1417.linux.x86-64.zip' \
  -e 'SN_URL=https://dev00000.service-now.com' \
  -e 'SN_USER=username' \
  -e 'SN_PASSWD=password' \
  -e 'SN_MID_NAME=my-mid-server' \
  -v './sn-midserver/logs:/opt/agent/logs' \
  lassekh/sn-mid-server:latest
```

or using Docker Compose:

```yaml
version: '3'
services:
  midserver:
    container_name: sn-midserver
    image: lassekh/sn-mid-server:latest
    volumes:
      - ./sn-midserver/logs:/opt/agent/logs
    network_mode: host
    environment:
      - SN_INSTALL_URL=https://install.service-now.com/glide/distribution/builds/package/mid/2020/03/31/mid.orlando-12-11-2019__patch2-03-18-2020_03-31-2020_1417.linux.x86-64.zip
      - SN_URL=https://dev00000.service-now.com
      - SN_USER=username
      - SN_PASSWD=password
      - SN_MID_NAME=my-mid-server
```

## Help

    Available options:
     mid:start          - Starts the mid server (default)
     mid:setup          - Generate config.xml
     mid:help           - Displays the help
     [command]          - Execute the specified linux command eg. bash.
