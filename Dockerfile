FROM eclipse-temurin:21-jdk-alpine

ENV MAVEN_VERSION="3.9.8"

ENV MAVEN_SHA512="e5a034a255b5f940d2baa0db1b64bed6ccbc1f568da6b79e37acd92817809c273158f52b2e0e2b942020efc203202f1338f2580590c8fd0ee4fca9bc08679577"

RUN wget --no-verbose https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip && \
  echo "${MAVEN_SHA512} apache-maven-${MAVEN_VERSION}-bin.zip" | sha512sum -c && \
  unzip apache-maven-${MAVEN_VERSION}-bin.zip && \
  rm apache-maven-${MAVEN_VERSION}-bin.zip && \
  mv apache-maven-${MAVEN_VERSION} /opt/maven

ENV PATH="$PATH:/opt/maven/bin"

WORKDIR /etc/maven

ENTRYPOINT ["mvn"]
