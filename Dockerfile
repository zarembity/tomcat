FROM ubuntu:20.04

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y default-jdk tomcat9 maven git

#tompcat settings
ENV CATALINA_HOME /usr/share/tomcat9
ENV PATH $CATALINA_HOME/bin:$PATH
ENV CATALINA_BASE /var/lib/tomcat9
RUN mkdir -p $CATALINA_HOME

#deploy java app by maven
WORKDIR /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && \
    mvn -f boxfuse-sample-java-war-hello/pom.xml package && \
    cp boxfuse-sample-java-war-hello/target/hello-1.0.war $CATALINA_BASE/webapps
EXPOSE 8080

WORKDIR $CATALINA_HOME
CMD ["catalina.sh", "run"]

