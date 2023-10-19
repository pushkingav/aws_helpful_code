#!/bin/bash

# get the AWS CLI version
aws --version

# PRODUCER

# CLI v2
aws kinesis put-record --stream-name DemoStream --partition-key user1 --data "user signup" --cli-binary-format raw-in-base64-out

# CLI v1
aws kinesis put-record --stream-name test --partition-key user1 --data "user signup"


# CONSUMER 

# describe the stream
aws kinesis describe-stream --stream-name DemoStream

# Consume some data
aws kinesis get-shard-iterator --stream-name DemoStream --shard-id shardId-000000000000 --shard-iterator-type TRIM_HORIZON

aws kinesis get-records --shard-iterator "AAAAAAAAAAEsx1BFu5ozlC+QshJsQojBJxf/NLraaSylRXidjddkuEunT8Qeb9fUgsxFZZk5JD3ChDml2Mmmt2N9uAadf0XmmwX4aG3SRz2Z0Cm12N+CSnowsxy+0xDI6fUsiWm/wK6UtTj24SgECF6oyKE6mD/f04J8cqzKnoOhMIc/TG3Ag1VAZck684DIQjjxCfQcXOfu46R3AjycIt9RRaZn6kUB34DZEjMIdv5repyyBF6Zwg=="