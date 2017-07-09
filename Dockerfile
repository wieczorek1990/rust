FROM elixir

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&\
 apt-get install -y inotify-tools postgresql-client &&\
 rm -rf /var/lib/apt/lists/*
RUN mix local.hex --force &&\
 mix local.rebar --force &&\
 mix archive.install --force https://github.com/phoenixframework/archives/raw/master/1.3-rc/phx_new-1.3.0-rc.2.ez

WORKDIR /srv
COPY bin .

CMD ./bin/run
