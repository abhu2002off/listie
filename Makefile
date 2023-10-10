server_run:
	cd listie_server && dart bin/main.dart

server_generate:
	cd listie_server && serverpod generate --watch

flutter_gen:
	cd listie_flutter && flutter packages pub run build_runner build --delete-conflicting-outputs