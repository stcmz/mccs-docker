FROM python:3-slim

WORKDIR /root

# Install .net 6.0 runtime
RUN file=packages-microsoft-prod.deb; \
    apt update && \
    apt install -y wget && \
    wget -q https://packages.microsoft.com/config/debian/11/$file -O $file && \
    dpkg -i $file && \
    rm -f $file && \
    apt update && \
    apt install -y apt-transport-https && \
    apt update && \
    apt install -y dotnet-runtime-6.0

# Install PROPKA
RUN pip install propka

# Install OpenBabel
RUN apt install -y openbabel

# Install Vega CLI
# Delete libssl.so and libcrypto.so because the system ships with newer version
RUN file=Vega_3.2.1.33_Linux_x86-x64-ARM.tar.gz; \
    wget -q https://www.ddl.unimi.it/vega/packages/$file && \
    tar -zxf $file -C / && \
    chmod -R 755 /Vega/Bin/* && \
    rm -f $file /Vega/Bin/Linux_x64/libssl.so* /Vega/Bin/Linux_x64/libcrypto.so*

ENV VEGADIR=/Vega
ENV LD_LIBRARY_PATH=$VEGADIR/Bin/Linux_x64:$LD_LIBRARY_PATH
ENV PATH=$VEGADIR/Bin/Linux_x64:$PATH

# Install chimera
# Please read the official licensing document before installing:
# https://www.cgl.ucsf.edu/chimera/docs/licensing.html
RUN file=chimera-1.16-linux_x86_64.bin; \
    wget -q https://www.cgl.ucsf.edu$(wget -q -O - --post-data "file=linux_x86_64%2F$file&choice=Accept" https://www.cgl.ucsf.edu/chimera/cgi-bin/secure/chimera-get.py | awk -v 'RS=http-equiv="[rR]efresh" *content="[0-9 ;]*[uU][rR][lL]=' -F '"' '/^\//{print $1;exit}') -O $file && \
    chmod +x $file && \
    echo /chimera | ./$file && \
    apt install -y libgl1 libxft2 libxss1 && \
    rm -f $file

ENV PATH=/chimera/bin:$PATH

# Install MCCS toolchain - jdock, mccsx, gpcrn, pdbm, pdbget, pdbqtf, pdbrn
RUN cd /usr/local/bin && \
    wget -q https://github.com/stcmz/jdock/releases/v2.2.3c/download/jdock_linux_x64 -O jdock && \
    wget -q https://github.com/stcmz/mccsx/releases/v1.4.2/download/mccsx_linux_x64 -O mccsx && \
    wget -q https://github.com/stcmz/gpcrn/releases/v1.0.8/download/gpcrn_linux_x64 -O gpcrn && \
    wget -q https://github.com/stcmz/pdbm/releases/v1.1.0/download/pdbm_linux_x64 -O pdbm && \
    wget -q https://github.com/stcmz/pdbget/releases/v1.0.3/download/pdbget_linux_x64 -O pdbget && \
    wget -q https://github.com/stcmz/pdbqtf/releases/v1.1/download/pdbqtf_linux_x64 -O pdbqtf && \
    wget -q https://github.com/stcmz/pdbrn/releases/v1.0.1/download/pdbrn_linux_x64 -O pdbrn && \
    chmod +x jdock mccsx gpcrn pdbm pdbget pdbqtf pdbrn && \
    apt install -y libgdiplus

# Clean up environment
RUN rm -rf /var/lib/apt/lists/*

# Install the script for fixing side chains
RUN wget -q https://gist.githubusercontent.com/bougui505/c8599a6659b368c18b45bc321c49a0b1/raw/9af9c7df24f9b5213a5d4362e5f871ce5b51140f/incompleteSideChains.py

# Default shell
CMD ["bash"]