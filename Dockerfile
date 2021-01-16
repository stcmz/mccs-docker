FROM python:3-slim

WORKDIR /root

# Install .net 5.0 runtime
RUN file=packages-microsoft-prod.deb; \
    apt update && \
    apt install -y wget && \
    wget -q https://packages.microsoft.com/config/debian/10/$file -O $file && \
    dpkg -i $file && \
    rm -f $file && \
    apt update && \
    apt install -y apt-transport-https && \
    apt update && \
    apt install -y dotnet-runtime-5.0

# Install PROPKA
RUN pip install propka

# Install OpenBabel
RUN apt install -y openbabel

# Install Vega CLI
RUN file=Vega_3.2.1.33_Linux_x86-x64-ARM.tar.gz; \
    wget https://www.ddl.unimi.it/vega/packages/$file && \
    tar -zxf $file -C / && \
    chmod -R 755 /Vega/Bin/* && \
    rm -f $file

ENV VEGADIR=/Vega
ENV LD_LIBRARY_PATH=$VEGADIR/Bin/Linux_x64:$LD_LIBRARY_PATH
ENV PATH=$VEGADIR/Bin/Linux_x64:$PATH

# Install jdock, mccsx, gpcrn, pdbm
RUN wget https://github.com/stcmz/jdock/releases/download/v2.2.3b/jdock_linux_x64 -O /usr/bin/jdock && \
    wget https://github.com/stcmz/mccsx/releases/download/v1.1.2/mccsx_linux_x64 -O /usr/bin/mccsx && \
    wget https://github.com/stcmz/gpcrn/releases/download/v1.0.4/gpcrn_linux_x64 -O /usr/bin/gpcrn && \
    wget https://github.com/stcmz/pdbm/releases/download/v1.0.4/pdbm_linux_x64 -O /usr/bin/pdbm && \
    chmod +x /usr/bin/jdock /usr/bin/mccsx /usr/bin/gpcrn /usr/bin/pdbm && \
    apt install -y libgdiplus

# Install chimera
# Please read the official licensing document before installing:
# https://www.cgl.ucsf.edu/chimera/docs/licensing.html
RUN file=chimera-1.15-linux_x86_64.bin; \
    wget https://www.cgl.ucsf.edu$(wget -q -O - --post-data "file=linux_x86_64%2F$file&choice=Accept" https://www.cgl.ucsf.edu/chimera/cgi-bin/secure/chimera-get.py | awk -v 'RS=http-equiv="[rR]efresh" *content="[0-9 ;]*[uU][rR][lL]=' -F '"' '/^\//{print $1;exit}') -O $file && \
    chmod +x $file && \
    bash -c "./$file <<</chimera" && \
    apt install -y libgl1 libxft2 libxss1 && \
    rm -f $file

ENV PATH=/chimera/bin:$PATH

# Install the script for fixing side chains
RUN wget -q https://gist.githubusercontent.com/bougui505/c8599a6659b368c18b45bc321c49a0b1/raw/9af9c7df24f9b5213a5d4362e5f871ce5b51140f/incompleteSideChains.py

# Clean up environment
RUN rm -rf /var/lib/apt/lists/*

# Default shell
CMD ["bash"]