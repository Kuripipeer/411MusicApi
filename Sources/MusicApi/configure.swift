import NIOSSL
import Fluent
import FluentMySQLDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(DatabaseConfigurationFactory.mysql(
        hostname: Environment.get("DATABASE_HOST") ?? "db-mysql-sfo3-61367-do-user-22002422-0.g.db.ondigitalocean.com",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? 25060,
        username: Environment.get("DATABASE_USERNAME") ?? "doadmin",
        password: Environment.get("DATABASE_PASSWORD") ?? "AVNS_Za6yFeuNrZozRCwxJpP",
        database: Environment.get("DATABASE_NAME") ?? "music_db",
        tlsConfiguration: .forClient(certificateVerification:.none)
    ), as: .mysql)

    app.migrations.add(CreateAlbum())

    // register routes
    try routes(app)
}
