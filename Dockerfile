FROM kalilinux/kali-rolling:latest

WORKDIR /root

RUN apt -y update && DEBIAN_FRONTEND=noninteractive apt -y dist-upgrade && apt -y autoremove && apt clean 

RUN apt -y install curl wget vim git net-tools whois netcat-traditional pciutils usbutils 

RUN DEBIAN_FRONTEND=noninteractive apt -y install kali-tools-top10 exploitdb

RUN apt -y install tor proxychains4
COPY config/proxychains4.conf /etc/proxychains4.conf

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/M507/k/main/files/install-tools.sh)"

RUN updatedb && \
    apt-get autoremove -y && \
    apt-get clean 

ENTRYPOINT ["/bin/bash"]
