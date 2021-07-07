import Vapor

func routes(_ app: Application) throws {
    
    let authController = AuthController()
    let productController = ProductController()
    let reviewController = ReviewController()
    let basketController = BasketController()
    
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
    app.get("getProductById", use: productController.getProductById)
    
    // MARK: - Review routing
    
    app.get("getAllReview", use: reviewController.getAllReview)
    app.post("addReview", use: reviewController.addReview)
    app.delete("deleteReview", use: reviewController.deleteReview)
    
    // MARK: - Basket routing
    
    app.post("addToBasket", use: basketController.addToBasket)
    app.delete("deleteFromBasket", use: basketController.deleteFromBasket)
    app.post("payBasket", use: basketController.payBasket)
}
