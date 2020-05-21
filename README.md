R7 - Identification of the problem you are trying to solve by building this particular marketplace app.
The development of technology, thus generating an increase in the consumption of goods online, I have aimed to make people who do not have financial conditions or even for people who want to increase their profit seeling their goods. It is worth mentioning that the goods sold in this marketplace will have to be made by hand. Given that, people could put their handmade products in this marketplace, trying to make money without having any cost at all.

R8- Why is it a problem that needs solving?
The world has evolved a lot, we have reached a point where the means of selling and online communications are extremely advantageous for the seller. As we can see nowadays, the world can change in a drastic way quickly, however, with the online market it means that sellers and buyers won't be as affected as a physical store. People will continue to sell and buy their products, even if there is a decrease in merchandise.

R9 - A link (URL) to your deployed app (i.e. website)
https://obscure-crag-39898.herokuapp.com/

R10 - A link to your GitHub repository (repo).
https://github.com/Pedro-Caiado/marketplace_first

R11 - Description of your marketplace app (website), including:
- Purpose
The purpose of this marketplace was primarily to increase my knowledge of the Rails framework and also the Ruby language. Of course, knowledge in html, scss and javascript. The second purpose of this marketplace was what was said above, to make the online market more accessible for people who want to increase their income or do not have the financial conditions to obtain a physical store, due to the costs.
- Functionality / features
This marketplace would have as features a main page to which the user would have access to all products already uploaded in the marketplace. However, the user could only sell or buy products if registered in the marketplace. The user will be able to purchase one or more products, and he must be logged in / signed up to obtain such features. The site contains a home page, a contact page and a page talking about the markeplace itself. The user may benefits buying more than a product while navigating on the website, the products will be in a Cart. The user may remove an item from the cart such as add more products into it. 
- Sitemap
FLOW CHART 

- Screenshots
Files have been attached to the Docs folder

- Target audience
As mentioned above, the market place has been created to make the online market more accessible for people who make handmade products and would like to increase their income or do not have the financial conditions to obtain a physical store, due to the costs.
- Tech stack (e.g. html, css, deployment platform, etc)
This marketplace was created using the Rails framework, using Ruby programming. HTML and JAVASCRIPT were also used. The app has been deployed on Heroku platform.

R12 - User stories for your app
https://trello.com/b/EGvsITiN/handmademarketplace

ScreenShots have been included in the Docs folder.

R13 - Wireframes for your app
Docs Folder

R14 - An ERD for your app
ERD is in the Docs folder

R15 - Explain the different high-level components (abstractions) in your app
ActiveRecord
ActiveRecord can be said to be a kind of ORM (Object Relation Map). The active record will make a mapping between the object and the database. The active record, will represent the MVP, model, view, controller. which is responsible for the system's logic and also the data representation. The active record acts as the layer at the top of the SQL database, thus allowing permission to act with the tables, using CRUD, create, read, update and delete. The application is using Postgres as its database.
Active Storage
Active storage was introduced to Rails as of version 5.2. He came so that there was a facility in uploading files to a cloud, like Amazon. I am using this Gem to upload the images related to the project.


R16 - Detail any third party services that your app will use
The App contain:
Gem 'devise' – Devise is a Gem for Ruby on Rails. Devise simplify the way a User can log in/log out from the application. Devise is a Gem used for authentication. 
Gem "rolify" – Rolify is a simple way used to set up user Roles. Roles are defined as what the users can do on the application, such as the admin.
Gem 'bootstrap' 
Gem Active Storage – Active Storage was included on Rails 5.2, it is a Gem that allows attach files, images. The upload can occur to acloud such as locally. 
Heroku – The app has been deployed on Heroku, a platform used as a cloud/server.
GitHub – The project has been pushed to GitHub in a public space.

R17 - Describe your projects models in terms of the relationships (active record associations) they have with each other
In the application was created 3 different modules, the User module, Product module and Cart module.
User - The User model is the primary model in the app. It holds relationships with almost every other model in the application. The User model has_many: products and also has_many: cards.
Products - The Product is a model created which has_one_attached: image and belongs_to: user. Thus, the product will have an image attached and also belongs to a user.
Cart - Cart is a module which belongs_to: user and also has_and_belongs_to_many: products.

R18 - Discuss the database relations to be implemented in your application
Devise - Devise creates the User model, which will be responsible for the authentication, registration, user password or admin.
User - the user can choose to have one or more of a product. And also, you can choose how many products you will have inside the Cart. The card may have a product, but also have more than one product inside of it, it will be decided by the user.
The Cart belongs to a user, and within that card you can have many products and belong to many prodcuts.


R19 - Provide your database schema design

  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.decimal "value"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "carts_products", id: false, force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "product_id", null: false
    t.index ["cart_id", "product_id"], name: "index_carts_products_on_cart_id_and_product_id"
    t.index ["product_id", "cart_id"], name: "index_carts_products_on_product_id_and_cart_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.text "description"
    t.string "condition"
    t.string "finish"
    t.decimal "price", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "title"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "carts", "users"
end


R20 - Describe the way tasks are allocated and tracked in your project
All project activities were developed based on a thought structure, with appropriate mechanisms so that the project had an adequate and precise line of follow-up. The project was formulated based on a wireframe, since then a Trello board was created, being filled in during the evolution of the project. GitHub was also used as a data storage source.
