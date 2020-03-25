# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
        
        class User < ApplicationRecord
          has_many :registrations
          has_many :events, through: :registrations
          has_many :hosting_events,  class_name: "Event", foreign_key:"user_id"
        end
        class Registration < ApplicationRecord
          belongs_to :user
          belongs_to :event
          belongs_to :registrant, class_name: "User", foreign_key:"user_id"
        end
        
        class Event < ApplicationRecord
          has_many :registrations
          has_many :registrants, through: :registrations
          belongs_to :host, class_name: "User", foreign_key:"user_id"
        end
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    * see above requirement and models
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    * see above requirement and models
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    * see above requirement and models
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    * see above requirement and models and the following scaffolding calls
                                
            rails g scaffold User name:string email:string --no-helper --no-jbuilder --no-javascripts --no-assets --no-scaffold-stylesheets --no-stylesheets --no-test-framework 
            rails g scaffold Event title:string location:string description:text meeting_datetime:datetime user:belongs_to --no-helper --no-jbuilder --no-javascripts --no-assets --no-scaffold-stylesheets --no-stylesheets --no-test-framework 
            rails g scaffold registration rsvp:string comment:string user:belongs_to event:belongs_to --no-helper --no-jbuilder --no-javascripts --no-assets --no-scaffold-stylesheets --no-stylesheets --no-test-framework 

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

        USER.rb:validates :email, presence: true, uniqueness: true
        EVENT.rb:validates :title, presence: true
        EVENT.rb:validates :location, presence: true
        EVENT.rb:validates :meeting_datetime , presence: true
        REGISTRATION.rb: validates :rsvp, presence: true, inclusion: { in: %w(Yes No Maybe)}
        

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

          In event.rb
          def registration(user)
            self.registrations.find_by(user_id: user.id)
          end
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [~] Views use helper methods if appropriate
- [x]  Views use partials if appropriate