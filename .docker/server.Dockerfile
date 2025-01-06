FROM i386/debian:10
# Install Packages / Dependencies
RUN echo "Acquire::Check-Valid-Until \"false\";\nAcquire::Check-Date \"false\";" | cat > /etc/apt/apt.conf.d/10no--check-valid-until
RUN apt-get -qq update \
    && apt-get -y install --no-install-recommends gdb curl ca-certificates zlib1g libffi6 libstdc++6 gcc screen \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/container
RUN chmod -R 777 ../container