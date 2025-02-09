# Usa a imagem oficial do Ubuntu como base
FROM ubuntu:22.04

# Define variáveis para evitar prompts de interação
ENV DEBIAN_FRONTEND=noninteractive

# Atualiza o sistema e instala dependências essenciais
RUN apt-get update && apt-get install -y \
    vim \
    neovim \
    curl \
    git \
    wget \
    unzip \
    python3 \
    python3-pip \
    build-essential \
    libnss3 \
    libasound2 \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxtst6 \
    libxkbcommon-x11-0 \
    openjdk-17-jdk \    
    android-sdk-platform-tools \
    android-sdk \
    && rm -rf /var/lib/apt/lists/*

# Create Folder
RUN mkdir /app

# Instala o Node.js e npm na versão compatível com Expo (atualmente 18.x)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npx yarn --force && yarn add expo

# Configura o diretório de trabalho
WORKDIR /app

# Copia os arquivos do projeto
COPY . /

# Expose Default
EXPOSE 8080 8081 3000

# Expor as portas necessárias para o Expo funcionar corretamente
EXPOSE 19000 19001 19002

CMD ["tail", "-f", "/dev/null"]
