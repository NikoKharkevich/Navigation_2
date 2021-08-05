
public struct ModelPost {

    public let author: String
    public let desciption: String
    public let image: String
    public let likes: Int
    public let views: Int
    
    public init(author: String, desciption: String, image: String, likes: Int, views: Int) {
        self.author = author
        self.desciption = desciption
        self.image = image
        self.likes = likes
        self.views = views
    }
}
