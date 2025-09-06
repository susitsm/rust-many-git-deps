#!/bin/bash

git submodule update --init
echo "Building cargo with parallel source updates"
cd cargo
cargo build -r
cd ../

if [ -z "${CARGO_HOME}" ]; then
    CARGO_HOME="$HOME/.cargo"
fi

GIT_DB="$CARGO_HOME/git/db"

REMOVE="$GIT_DB/hashbrown* $GIT_DB/syn* $GIT_DB/bitflags* $GIT_DB/quote* $GIT_DB/serde* $GIT_DB/json* $GIT_DB/tokio* $GIT_DB/reqwest* $GIT_DB/tracing* $GIT_DB/anyhow* $GIT_DB/thiserror* $GIT_DB/futures-rs* $GIT_DB/bytes*"
GIT_DB="$CARGO_HOME/git/checkouts"
REMOVE2="$GIT_DB/hashbrown* $GIT_DB/syn* $GIT_DB/bitflags* $GIT_DB/quote* $GIT_DB/serde* $GIT_DB/json* $GIT_DB/tokio* $GIT_DB/reqwest* $GIT_DB/tracing* $GIT_DB/anyhow* $GIT_DB/thiserror* $GIT_DB/futures-rs* $GIT_DB/bytes*"
REMOVE_ALL="$REMOVE $REMOVE2"
echo "Starting \"cargo update\" benchmarks"
CARGO_VERSION=$(cargo --version)

rm -rf $REMOVE_ALL
echo "Uncached, serial, $CARGO_VERSION:"
time cargo update --quiet
echo

rm -rf $REMOVE_ALL
echo "Uncached, parallel:"
time ./cargo/target/release/cargo update --quiet
echo

echo "Cached, serial, $CARGO_VERSION:"
time cargo update --quiet
echo

echo "Cached, parallel:"
time ./cargo/target/release/cargo update --quiet
echo

rm -rf $REMOVE_ALL
echo "Uncached, shallow, serial, $CARGO_VERSION:"
time cargo -Zgit=shallow-deps update --quiet
echo

rm -rf $REMOVE_ALL
echo "Uncached, shallow, parallel:"
time ./cargo/target/release/cargo -Zgit=shallow-deps update --quiet
echo

