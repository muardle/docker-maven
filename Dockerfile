FROM eclipse-temurin:21-jdk-alpine

ENV MAVEN_VERSION="3.9.2"

ENV MAVEN_SHA512="f7296534ce624f688268e55544ffdf0b37562ac71dbcede4fe4f994b4e9487b7d66934849204373e127cfacc709cd5fd9152a53c06d778fc391aee84aa3364a3"

RUN wget --no-verbose https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip && \
  echo "${MAVEN_SHA512} apache-maven-${MAVEN_VERSION}-bin.zip" | sha512sum -c && \
  unzip apache-maven-${MAVEN_VERSION}-bin.zip && \
  rm apache-maven-${MAVEN_VERSION}-bin.zip && \
  mv apache-maven-${MAVEN_VERSION} /opt/maven

ENV PATH="$PATH:/opt/maven/bin"

WORKDIR /etc/maven

ENTRYPOINT ["mvn"]
