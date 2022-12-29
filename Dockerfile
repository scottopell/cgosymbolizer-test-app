FROM golang:1.19 as build

WORKDIR /go/src/app
COPY . .

RUN go mod download
RUN go build -o /go/bin/with_symbolizer -gcflags '-N -l'


RUN sed -i 's/_ "github.com\/ianlancetaylor\/cgosymbolizer"/\/\/placeholder/' crash.go

RUN go build -o /go/bin/without_symbolizer -gcflags '-N -l'


FROM ubuntu:jammy-20221130
COPY --from=build /go/bin/with_symbolizer /
COPY --from=build /go/bin/without_symbolizer /
COPY entrypoint.sh /
CMD ["/entrypoint.sh"]
