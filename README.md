# lua-resty-openidc-keycloak

# Overview
This is an implementation of a gateway “service” using OpenResty. OpenResty is based on Nginx, and in this case will work as an Nginx reverse proxy. In addiditon to beeing a reverse-proxy, it will authenticate every request via Keycloak using OpenId Connect.

## Run
```
$ docker-compose build
$ docker-compose up -d
```

## Usage

### Local
1. Add below in hosts file.
```
127.0.0.1	localhost keycloak
```
2. Acccess to ``http://localhost`` .

3. Input user name and password.

## Info
### master realm
|user name  |password  |
|---|---|
|admin  |password  |

### demo realm
|user name  |password  |
|---|---|
|user  |password  |

## References
- https://github.com/zmartzone/lua-resty-openidc
- https://github.com/nginxinc/nginx-openid-connect
- https://github.com/bungle/lua-resty-session
- https://daenney.github.io/2019/10/05/beyondcorp-at-home-authn-authz-openresty/