# searxng-tls-docker
Create a searxng instance using caddy for TLS encryption.

# Usage
1. Clone this repository: `git clone https://github.com/si6nal/searxng-tls-docker.git`
2. Run the setup script, this script will print nothing if it succeeds. 
`chmod +x ./setup.sh` -> `./setup.sh`

3. Run docker compose: `sudo docker compose up -d`

Note: By default this will use non-default ports. Port 4380 for HTTP, and port 4343 for HTTPS.
If you want to use different ports (or default ports) replace all occurrences in `compose.yml` and `caddy/Caddyfile`.

You should now be able to access searxng at `https://(HOSTNAME):4343/`. The default searxng port is also accessible (8080, HTTP).

### Root certificate
To get the root certificate to add to your browser: `sudo docker cp caddy:/data/caddy/pki/authorities/local/root.crt .`

Save this root.crt file locally & follow the steps for the browser you use to add it.
