docker build -t reega/jfx .
CID=$(docker create reega/jfx)
docker cp ${CID}:/app/compiled.zip ./
docker rm ${CID}

