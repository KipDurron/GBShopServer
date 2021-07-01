import Vapor

func routes(_ app: Application) throws {
    
    let authController = AuthController()
    
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    app.post("register", use: authController.register)
}
