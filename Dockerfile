FROM theiaide/theia:latest

# We need to add openssl to be able to create the certificates on demand
USER root
RUN apk add openssl
RUN npm install -g gen-http-proxy
USER theia

# RUN mkdir /home/theia/ssl && chown theia /home/theia/ssl 
ADD ssl_theia.sh /home/theia/ssl/
WORKDIR /home/theia/ssl

# Run theia and accept theia parameters
ENTRYPOINT [ "/home/theia/ssl/ssl_theia.sh" ]