FROM eclipse-temurin:21-jdk-alpine

ENV MAVEN_VERSION="3.9.6"

ENV MAVEN_SHA512="0eb0432004a91ebf399314ad33e5aaffec3d3b29279f2f143b2f43ade26f4db7bd1c0f08e436e9445ac6dc4a564a2945d13072a160ae54a930e90581284d6461"

RUN wget --no-verbose https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip && \
  echo "${MAVEN_SHA512} apache-maven-${MAVEN_VERSION}-bin.zip" | sha512sum -c && \
  unzip apache-maven-${MAVEN_VERSION}-bin.zip && \
  rm apache-maven-${MAVEN_VERSION}-bin.zip && \
  mv apache-maven-${MAVEN_VERSION} /opt/maven

ENV PATH="$PATH:/opt/maven/bin"

WORKDIR /etc/maven

ENTRYPOINT ["mvn"]
