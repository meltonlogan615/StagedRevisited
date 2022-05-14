#  Flow & Architecture

## Flow

### Frontend
SearchViewController (~/Controllers/SearchVCs/SearchViewController)
            |---> Loads SearchView (~/Views/SearchViews/SearchView)
                  |---> UITextField Recieves Input ---|
                                                      |
      |------------ SearchButtonTapped <--------------|
      |
      |---> If UITexField is Empty, display error message
      |
      |---> Display Results in RecipeListCollectionView (~/Controllers/CollectionVCs/RecipeListCollectionView) 
            |---> CollectionViewCells ----------------| (~/Views/Elements/RecipeCell)
                                                      |
      |------------- DidSelectRowAt ------------------|
      |
      |---> RecipieViewController (~/Controllers/RecipeVCs/RecipeViewController)
            |
            |---> Methods That Run on viewDidLoad
            |     |---> None
            |
            |---> Methods That Run on viewWillAppear
            |     |---> loadRecipeByID(for: recipeID)   (local method)
            |     |---> getInstructions(for: recipeID)  (local method)
            |
            |---> Loads RecipeView
            |     |
            |     |---> General Button: 
            |     |     |---> Loads GeneralModal (~/Viiews/Modals/GeneralModal)
            |     |     |---> Displays Basic Info, i.e. Time To Make, # of Servings, etc.
            |     |     |---> Data populated from method generateGeneralInfo(for selectedRecipe: Recipe) (~/Controllers/VCMethods/DataGeneration/GeneralInfo) *Extension of RecipeViewController*
            |     |
            |     |---> Ingredients Button:
            |     |     |---> Loads IngredientsModal (~/Viiews/Modals/IngredientsModal)
            |     |     |---> Displays all Ingredients & Units of Measure
            |     |     |---> Data populated from method generateIngredientsList(for selectedRecipe: Recipe) (~/Controllers/VCMethods/DataGeneration/GenerateIngredientsList) *Extension of RecipeViewController*
            |     |
            |     |---> Summery Button:
            |     |     |---> Loads SummaryModal (~/Viiews/Modals/SummaryModal)
            |     |     |---> Displays Summary of Recipe from API
            |     |     |---> Data populated from method generateSummary(for selectedRecipe: Recipe) (~/Controllers/VCMethods/DataGeneration/GenerateSummary) *Extension of RecipeViewController*
            |     |
            |     |---> Nutrition Button:
            |     |     |---> Loads SummaryModal (~/Viiews/Modals/MacrosModal)
            |     |     |---> Displays Nutrition Information, i.e. calories, iron, vitamins, etc
            |     |     |---> Data populated from method generateDietsInfo(for selectedRecipe: Recipe) (~/Controllers/VCMethods/DataGeneration/GenerateMacros) *Extension of RecipeViewController*
            |     |
            |     |---> Diets Button:
            |     |     |---> Loads SummaryModal (~/Viiews/Modals/DietsModal)
            |     |     |---> Displays Diets Information, i.e. vegan, gluten free, keto, etc
            |     |     |---> Data populated from method generateMacrosModel(for selectedRecipe: Recipe) (~/Controllers/VCMethods/DataGeneration/GenerateDietsInfo) *Extension of RecipeViewController*



