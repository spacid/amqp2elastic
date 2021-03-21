FROM scratch

COPY ./target/x86_64-unknown-linux-musl/release/amqp2elastic /amqp2elastic
ENTRYPOINT [ "/amqp2elastic" ]
