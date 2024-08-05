local opts = {
    ssl_verify = "no",
    redirect_uri = "http://localhost/cb",
    discovery = "http://keycloak:8080/realms/demo/.well-known/openid-configuration",
    logout_path = "/logout",
    scope = "openid email profile",
    client_id = "sample-app",
    client_secret = "d59cc875-2546-4bc6-81a9-f34ceb82f662"
}

-- Only redirect to auth page if client requests text/html, reject with 403 otherwise
local action = "deny"
if ngx.var.http_accept then
  for ct in (ngx.var.http_accept .. ","):gmatch("([^,]*),") do
    if string.sub(ct, 0, 9) == "text/html" then
      action = null
      break
    end
  end
end

-- call authenticate for OpenID Connect user authentication
local res, err = require("resty.openidc").authenticate(opts, null, action)
if err then
  ngx.status = 403
  ngx.say(err)
  ngx.exit(ngx.HTTP_FORBIDDEN)
end

ngx.req.set_header("X-USER", res.id_token.sub)

ngx.var.pass="http://webapp:3000/"