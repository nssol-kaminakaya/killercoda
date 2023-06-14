# docker compose install
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

# install jq command
apt install jq -y

# git clone
git clone https://github.com/open-telemetry/opentelemetry-demo.git -b 1.4.0

# image pull
cd opentelemetry-demo/
docker compose pull

# notify finish setup
touch /tmp/finished