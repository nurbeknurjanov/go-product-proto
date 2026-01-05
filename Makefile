.PHONY: proto
proto:
	protoc \
	  --proto_path=proto \
	  --go_out=gen \
	  --go-grpc_out=gen \
	  --go_opt=paths=source_relative \
	  --go-grpc_opt=paths=source_relative \
      proto/*/*.proto

.PHONY: proto-web
proto-web:
	npx protoc \
	  --proto_path=proto \
      --js_out=import_style=commonjs,binary:./webgen \
      --grpc-web_out=import_style=typescript,mode=grpcwebtext:./webgen \
      proto/*/messages.proto \
      proto/*/service.proto

#-I это сокращение --proto_path

#npm install --save-dev google-protobuf protoc-gen-grpc-web  protoc-gen-js