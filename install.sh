# Install docker rollout
# Create directory for Docker cli plugins
mkdir -p ~/.docker/cli-plugins
# Download docker-rollout script to Docker cli plugins directory
curl https://raw.githubusercontent.com/wowu/docker-rollout/master/docker-rollout -o ~/.docker/cli-plugins/docker-rollout
# Make the script executable
chmod +x ~/.docker/cli-plugins/docker-rollout

# # Add the plugin to the Docker CLI
# sudo cp plugin/docker-shifter.sh /usr/local/bin/docker-shifter

# # Make the script executable
# sudo chmod +x /usr/local/bin/docker-shifter

# if echo "$PATH" | grep -q "/usr/local/bin"; then
#     echo "Docker shifter installed successfully."
# else
#     echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
#     source ~/.bashrc
#     echo "Docker shifter installed successfully."
# fi

# Install docker shifter
curl https://raw.githubusercontent.com/wowu/docker-rollout/master/docker-rollout -o ~/.docker/cli-plugins/docker-rollout
# Make the script executable
chmod +x ~/.docker/cli-plugins/docker-rollout