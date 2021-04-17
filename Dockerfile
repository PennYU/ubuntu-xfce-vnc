FROM consol/ubuntu-xfce-vnc:latest

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils gcc g++ openssh-server build-essential gdb gdbserver rsync vim python-dev libssl-dev alien fakeroot unzip tmux git inetutils-ping && \
    apt clean && \
    apt autoremove -y && \
    wget https://github.com/Kitware/CMake/releases/download/v3.9.2/cmake-3.9.2-linux-x86_64.tar.gz && \
    tar xvf cmake-3.9.2-linux-x86_64.tar.gz -C /usr/local/ && \
    rm -rf cmake-3.9.2-linux-x86_64.tar.gz && \
    git config --global http.sslverify false && \
    git config --global credential.helper store && \
    echo "export PATH=\"/usr/local/cmake-3.9.2-Linux-x86_64/bin:\$PATH\"" >> ~/.bashrc
