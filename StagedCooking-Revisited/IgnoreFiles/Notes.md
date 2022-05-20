#  Notes

### Iconography
- Total Time Icon: stopwatch
- Servings Icon: person
- Save / Saved: bookmark / bookmark.fill

### Ingredients View
- trade out general data for iconography


### Version 2.0
  - Advanced Search Features for Subscribers
  
  
  - Search Recipe by an Array of Ingredients
    - https://api.spoonacular.com/recipes/findByIngredients?ingredients=apples,+flour,+sugar&number=2
    - ingredients - String of comma-seperated values, no spaces
    - number - number of recipes to return
    - ranking (1 = maximize used ingredients, 2 = minimized missing ingredients)
    - returns an array of Recipes (BasicSearch)


  - Get Simlar Recipes
      - https://api.spoonacular.com/recipes/715538/similar
      - returns a single recipe

### Account Creation Flow
  - Log In / Sign Up Screen
    - Log In
      - email / password text fields
      - submit button
      - Goes to SearchViewController
    - Sign Up
      - Name / Email text fields (Firebase Authentication)
      - Sign Up With Apple
      - Submit Button
      - Goes to SettingsViewController
      
### SettingsViewController
  - UISegmentController
  - IntolerancesView to Toggle Options
  - DietsView to Toggle Those Options
  - Save
  
      
