FROM eclipse-temurin:21-jdk-alpine

ENV MAVEN_VERSION="3.9.7"

ENV MAVEN_SHA512="f194c80487a8838e1b1d8dd262ecf8c6e577fd1082c562ba063763f7c22ee50264221c837b941276d453b3b4f0265dd47fdb18344a2cb744d96e0353b480123f"

RUN wget --no-verbose https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip && \
  echo "${MAVEN_SHA512} apache-maven-${MAVEN_VERSION}-bin.zip" | sha512sum -c && \
  unzip apache-maven-${MAVEN_VERSION}-bin.zip && \
  rm apache-maven-${MAVEN_VERSION}-bin.zip && \
  mv apache-maven-${MAVEN_VERSION} /opt/maven

ENV PATH="$PATH:/opt/maven/bin"

WORKDIR /etc/maven

ENTRYPOINT ["mvn"]
