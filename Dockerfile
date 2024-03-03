FROM eclipse-temurin:21-jdk-alpine

ENV MAVEN_VERSION="3.9.4"

ENV MAVEN_SHA512="755e7b757ea011621d704b9d2bee8fc344b77c13117077caa71abea560f20926a2bc8c96f990ed298f2dfc14bdba376566ee11c66c547f2594579f9cb3c50e1c"

RUN wget --no-verbose https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip && \
  echo "${MAVEN_SHA512} apache-maven-${MAVEN_VERSION}-bin.zip" | sha512sum -c && \
  unzip apache-maven-${MAVEN_VERSION}-bin.zip && \
  rm apache-maven-${MAVEN_VERSION}-bin.zip && \
  mv apache-maven-${MAVEN_VERSION} /opt/maven

ENV PATH="$PATH:/opt/maven/bin"

WORKDIR /etc/maven

ENTRYPOINT ["mvn"]
