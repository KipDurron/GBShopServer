import Vapor

func routes(_ app: Application) throws {
    
    let authController = AuthController()
    let productController = ProductController()
    
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    // MARK: - User routing
    
    app.post("register", use: authController.register)
    
    app.get("login", use: authController.login)
    
    app.put("changeUserData", use: authController.changeUserData)
    
    app.get("logout", use: authController.logout)
    
    // MARK: - Product routing
    
    app.get("getAllProduct", use: productController.getAllProduct)
    
}
