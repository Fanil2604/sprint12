FROM golang:1.23.3

WORKDIR /app

COPY . .

RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main main.go parcel.go

RUN go build ./main.go ./parcel.go;

#CMD ./main

CMD ["/main"]