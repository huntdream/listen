struct AppConfig {
    static let baseURL: String = {
    #if DEBUG
            return "http://localhost:4000"
    #else
            return "https://music.maoyu.space/api"
    #endif
        }()
}
