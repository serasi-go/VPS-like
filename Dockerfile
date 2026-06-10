FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Update + install core tools
RUN apt update && apt install -y \
    curl \
    wget \
    git \
    nano \
    sudo \
    python3 \
    python3-pip \
    ca-certificates \
    htop \
    gnupg

# Install latest Node.js (better than Ubuntu default)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt install -y nodejs

# Install ttyd
RUN apt install -y ttyd

# Install code-server (VS Code browser)
RUN curl -fsSL https://code-server.dev/install.sh | sh

#curl -Lso- bench.sh | bash


# Create user
RUN useradd -m railway \
    && echo "railway:railway" | chpasswd \
    && adduser railway sudo

WORKDIR /home/railway/app

# Copy files
COPY . .

# Install dependencies (fail if broken)
RUN rm -rf node_modules package-lock.json
RUN npm install express --save
RUN npm install

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose Railway port
# EXPOSE 3000
EXPOSE 80 443 3000 3306 4040 5432 5700 5701 5010 6800 6900 8080 8888 9000

# Start container
CMD ["/start.sh"]
