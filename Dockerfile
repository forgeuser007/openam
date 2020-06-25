FROM openjdk:8
MAINTAINER "OpenAM ADMIN"
ENV PATH="/opt/tomcat/bin:${PATH}"
RUN mkdir /opt/bin
RUN mkdir /opt/bin/amster
COPY amster /opt/bin/amster/
ENV SERVER_TYPE="first"
ENV CFGHOST="192.168.56.5"
ENV CFGADMINPORT="1444"
ENV CFGLPORT="1389"
ENV CFGUSER="cn=dirmgr"
ENV CFGPASS="password"

ENV DSHOST="192.168.56.5"
ENV DSADMINPORT="2444"
ENV DSLPORT="2389"
ENV DSUSER="cn=dirmgr"
ENV DSPASS="password"
ENV DSSUFFIX="dc=example,dc=com"
ENV AMHOST="am1.example.com"
ENV AMPASS="password"
RUN mkdir /opt/tomcat
COPY tomcat /opt/tomcat/
COPY entrypoint.sh /opt
COPY setupam.sh /opt/bin
COPY firstins.amster /opt/bin
COPY secondins.amster /opt/bin
EXPOSE 8080
EXPOSE 8443
ENTRYPOINT ["/opt/entrypoint.sh"]
CMD ["catalina.sh", "run"]
