FROM eclipse-temurin:21-jdk-alpine

ENV MAVEN_VERSION="3.9.0"

ENV MAVEN_SHA512="564fe44bfa9c7ad3e2703cbbac59d43a11fa39e4e68875d3d1584d0a0b7b77a1352da246b875c4c15d11ceb6b4dd9a0ce7dd7a48695725dce594f34325c9c605"

RUN wget --no-verbose https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip && \
  echo "${MAVEN_SHA512} apache-maven-${MAVEN_VERSION}-bin.zip" | sha512sum -c && \
  unzip apache-maven-${MAVEN_VERSION}-bin.zip && \
  rm apache-maven-${MAVEN_VERSION}-bin.zip && \
  mv apache-maven-${MAVEN_VERSION} /opt/maven

ENV PATH="$PATH:/opt/maven/bin"

WORKDIR /etc/maven

ENTRYPOINT ["mvn"]
