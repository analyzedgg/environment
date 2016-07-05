FROM java:8
WORKDIR /usr/src/analyzedgg/backend
COPY api-0.0.1.jar .
COPY prod.conf .
CMD [ "java", "-Dconfig.file=./prod.conf", "-jar", "api-0.0.1.jar" ]
