#!/usr/bin/env sh

set -ev

./gradlew publishToMavenLocal

./gradlew -b examples/test1/build.gradle --refresh-dependencies --rerun-tasks clean check

./gradlew -b examples/test2/build.gradle --refresh-dependencies --rerun-tasks clean check
