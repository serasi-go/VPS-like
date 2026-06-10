FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install system tools
RUN apt update && apt install -y \
    curl \
    wget \
    git \
    nano \
    sudo \
    python3 \
    python3-pip \
    nodejs \
    npm

# Install code-server (browser VS Code)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Install ttyd (web terminal)
RUN apt install -y ttyd

# Create user
RUN useradd -m railway && echo "railway:railway" | chpasswd && adduser railway sudo

WORKDIR /home/railway/app

# Copy your repo files
COPY . .

# Install Node dependencies (important for your bot)
RUN npm install || true

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 3000

CMD ["/start.sh"]
