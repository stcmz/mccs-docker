FROM python:3-slim

WORKDIR /root

# Install .NET 8.0 runtime
RUN file=packages-microsoft-prod.deb; \
    apt update && \
    apt install -y wget && \
    wget -q https://packages.microsoft.com/config/debian/12/$file -O $file && \
    dpkg -i $file && \
    rm -f $file && \
    apt update && \
    apt install -y dotnet-runtime-8.0

# Install PROPKA
RUN pip install propka

# Install OpenBabel
RUN apt install -y openbabel

# Install Vega CLI
# Delete libssl.so and libcrypto.so because the system ships with newer version
RUN file=Vega_3.2.3.28_Linux_x86-x64-ARM.tar.gz; \
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
RUN file=chimera-1.17.3-linux_x86_64.bin; \
    wget -q https://www.cgl.ucsf.edu$(wget -q -O - --post-data "file=linux_x86_64%2F$file&choice=Accept" https://www.cgl.ucsf.edu/chimera/cgi-bin/secure/chimera-get.py | awk -v 'RS=http-equiv="[rR]efresh" *content="[0-9 ;]*[uU][rR][lL]=' -F '"' '/^\//{print $1;exit}') -O $file && \
    chmod +x $file && \
    echo /chimera | ./$file && \
    apt install -y libgl1 libxft2 libxss1 && \
    rm -f $file

ENV PATH=/chimera/bin:$PATH

# Install MCCS toolchain - jdock, mccsx, gpcrn, pdbm, pdbget, pdbqtf, pdbrn
RUN cd /usr/local/bin && \
    wget -q https://github.com/stcmz/jdock/releases/download/v2.2.3c/jdock_linux_x64 -O jdock && \
    wget -q https://github.com/stcmz/mccsx/releases/download/v1.5.1/mccsx_linux_x64 -O mccsx && \
    wget -q https://github.com/stcmz/gpcrn/releases/download/v1.0.8/gpcrn_linux_x64 -O gpcrn && \
    wget -q https://github.com/stcmz/pdbm/releases/download/v1.1.0/pdbm_linux_x64 -O pdbm && \
    wget -q https://github.com/stcmz/pdbget/releases/download/v1.2.4/pdbget_linux_x64 -O pdbget && \
    wget -q https://github.com/stcmz/pdbqtf/releases/download/v1.1/pdbqtf_linux_x64 -O pdbqtf && \
    wget -q https://github.com/stcmz/pdbrn/releases/download/v1.0.1/pdbrn_linux_x64 -O pdbrn && \
    chmod +x jdock mccsx gpcrn pdbm pdbget pdbqtf pdbrn && \
    apt install -y libgdiplus

# Clean up environment
RUN rm -rf /var/lib/apt/lists/*

# Install the script for fixing side chains
RUN wget -q https://gist.githubusercontent.com/bougui505/c8599a6659b368c18b45bc321c49a0b1/raw/9af9c7df24f9b5213a5d4362e5f871ce5b51140f/incompleteSideChains.py

# Default shell
CMD ["bash"]