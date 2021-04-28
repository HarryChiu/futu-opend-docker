FROM ubuntu:16.04

ENV PACKAGE_NAME=FutuOpenD_5.3.1508_Ubuntu16.04

RUN apt-get update && apt-get install -y wget net-tools && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* \
    && wget -O - https://softwarefile.futunn.com/${PACKAGE_NAME}.tar.gz | tar -xzf - -C / \
	&& ln -s /${PACKAGE_NAME}/${PACKAGE_NAME} /FutuOpenD \
	&& sed -i '/<\/api_port>/a\<rsa_private_key>/home/rsa</rsa_private_key>' /FutuOpenD/FutuOpenD.xml

WORKDIR /FutuOpenD
EXPOSE 11111
EXPOSE 22222
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["--help"]

