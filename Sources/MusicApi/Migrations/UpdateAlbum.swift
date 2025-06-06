import Fluent

struct UpdateArtist: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("albums")
            .id()
            .field("year", .string)
            .create()
    }

    func revert(on database: any Database) async throws {
        try await database.schema("albums")
            .deleteField("year")
            .update()
    }
}