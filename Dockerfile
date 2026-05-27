FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    wget \
    gpg \
    dbus-x11 && \
    apt clean

RUN wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O /etc/apt/keyrings/packages.mozilla.org.asc && \
    gpg -q --import /etc/apt/keyrings/packages.mozilla.org.asc && \
    echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" > /etc/apt/sources.list.d/mozilla.list && \
    echo "Package: *\nPin: origin packages.mozilla.org\nPin-Priority: 1000" > /etc/apt/preferences.d/mozilla

RUN apt update && apt install -y firefox && \
    apt clean

CMD ["firefox"]
