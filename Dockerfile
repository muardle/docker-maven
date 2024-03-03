FROM eclipse-temurin:21-jdk-alpine

ENV MAVEN_VERSION="3.9.1"

ENV MAVEN_SHA512="4ae5a0d17f9e6cbe57640c481f426a9184dfb451c2bb7cc7db324da095f616a14e7c482a79240e5286e241d8cd2805ea1cd9c95e38954101c2fa4088baad9a1a"

RUN wget --no-verbose https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip && \
  echo "${MAVEN_SHA512} apache-maven-${MAVEN_VERSION}-bin.zip" | sha512sum -c && \
  unzip apache-maven-${MAVEN_VERSION}-bin.zip && \
  rm apache-maven-${MAVEN_VERSION}-bin.zip && \
  mv apache-maven-${MAVEN_VERSION} /opt/maven

ENV PATH="$PATH:/opt/maven/bin"

WORKDIR /etc/maven

ENTRYPOINT ["mvn"]
