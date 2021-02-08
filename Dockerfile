FROM ubuntu:20.04

ENV LANG=C.UTF-8

RUN apt update
RUN apt install default-jdk -y tomcat9 -y maven -y git -y

ENV CATALINA_HOME /usr/share/tomcat9
ENV PATH $CATALINA_HOME/bin

RUN mkdir -p "$CATALINA_HOME" /usr/share/tomcat9/temp

WORKDIR $CATALINA_HOME

EXPOSE 8080

ADD ./ssh-key ~/.ssh/

CMD ["catalina.sh", "run"]

