# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)

    - User has_many tanks
    - Tank has_many fish
    - Tank has_many plants
      
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

    - Tank belongs_to User
    - Fish belongs_to Tank
    - Plant belongs_to Fish
    
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

    - User has_many Fish, through Tanks
    - User has_many Plants, through Tanks
    
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

    - Tank has_many Tasks, through Maintenance
    - Task has_many Tanks, through Maintenance
    
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

    - Maintenance has :complete and :due
    
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

    - Maintenance sort feature
        - self.by_tank(tank)
        - self.by_task(task)
        - self.today
        - self.upcoming
        - self.overdue
        - self.by_complete
        - self.by_incomplete
        - self.this_week

- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)

    - users/:user_id/tanks/:id
    
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)

    - users/:user_id/tanks/new
    - tanks/:tank_id/plants/new
    - tanks/:tank_id/fish/new
    
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate