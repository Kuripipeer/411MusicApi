import Vapor

struct AlbumDTO : Content {
    var id : UUID?
    var title : String
    var description : String
    var artist : String
    var image : String
    
}