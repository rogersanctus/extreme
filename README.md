# Extreme

[![Build Status](https://github.com/exponentially/extreme/actions/workflows/test.yml/badge.svg)](https://github.com/exponentially/extreme/actions/workflows/test.yml)
[![Hex version](https://img.shields.io/hexpm/v/extreme.svg "Hex version")](https://hex.pm/packages/extreme)
[![InchCI](https://inch-ci.org/github/exponentially/extreme.svg?branch=v1.0.0)](https://inch-ci.org/github/exponentially/extreme)
[![Coverage Status](https://coveralls.io/repos/github/exponentially/extreme/badge.svg?branch=v1.0.0)](https://coveralls.io/github/exponentially/extreme?branch=v1.0.0)

## General

Erlang/Elixir TCP client for [Event Store](http://geteventstore.com/).

This version is tested with EventStore 21.10.1, Elixir 1.14 and Erlang/OTP 25.2

Documentation is TBD

## Protobuf
This version is using [:protobuf](https://github.com/elixir-protobuf/protobuf) for messages encoding. Please read its documentation about instalation and configuration.

### Generate Protobuf Messsage modules
```bash
protoc --elixir_out=lib/extreme/messages -Iinclude include/*.proto
```

That will generate the files inside the lib/extreme/messages folder. The name of the files are the name of the .proto files appended by .pb.ex