FROM ubuntu:16.04

ADD "https://softwarefile.futunn.com/FutuOpenD_5.1.1320_Ubuntu16.04.tar.gz" /home/
COPY docker-entrypoint.sh /home/
#COPY "FutuOpenD_5.1.1320_Ubuntu16.04.tar.gz" docker-entrypoint.sh /home/

WORKDIR /home
RUN tar zxf "FutuOpenD_5.1.1320_Ubuntu16.04.tar.gz" && chmod +x docker-entrypoint.sh \
    && sed -i '/<\/api_port>/a\<rsa_private_key>/home/rsa</rsa_private_key>' /home/FutuOpenD_5.1.1320_Ubuntu16.04/FutuOpenD_5.1.1320_Ubuntu16.04/FutuOpenD.xml

EXPOSE 11111
EXPOSE 22222
ENTRYPOINT ["/home/docker-entrypoint.sh"]
CMD ["--help"]

