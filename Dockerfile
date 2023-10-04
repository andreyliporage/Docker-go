FROM golang:1.19 AS build

WORKDIR /src

COPY . /src

RUN CGO_ENABLED=0 GOOS=linux go build -o app main.go

FROM scratch

WORKDIR /src

COPY --from=build /src/app ./

CMD [ "./app" ]