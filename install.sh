# Install docker rollout
# Create directory for Docker cli plugins
mkdir -p ~/.docker/cli-plugins

# Download docker-rollout script to Docker cli plugins directory
curl https://raw.githubusercontent.com/wowu/docker-rollout/master/docker-rollout -o ~/.docker/cli-plugins/docker-rollout
# Make the script executable
chmod +x ~/.docker/cli-plugins/docker-rollout

# Install docker shifter Docker cli plugins directory
curl https://raw.githubusercontent.com/dyedfox/docker-shifter/refs/heads/main/plugin/docker-shifter -o ~/.docker/cli-plugins/docker-shifter
# Make the script executable
chmod +x ~/.docker/cli-plugins/docker-shifter