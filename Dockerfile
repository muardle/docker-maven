FROM eclipse-temurin:21-jdk-alpine

ENV MAVEN_VERSION="3.9.3"

ENV MAVEN_SHA512="fba80f4bb0429052d558959b1bfbc99984f8cb8ff59a53baae0a0874b71a2601e2805c5e557b7b59d81716a0b4b35d1b2eeccb566c40b23cc575331a4984ef6c"

RUN wget --no-verbose https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip && \
  echo "${MAVEN_SHA512} apache-maven-${MAVEN_VERSION}-bin.zip" | sha512sum -c && \
  unzip apache-maven-${MAVEN_VERSION}-bin.zip && \
  rm apache-maven-${MAVEN_VERSION}-bin.zip && \
  mv apache-maven-${MAVEN_VERSION} /opt/maven

ENV PATH="$PATH:/opt/maven/bin"

WORKDIR /etc/maven

ENTRYPOINT ["mvn"]
