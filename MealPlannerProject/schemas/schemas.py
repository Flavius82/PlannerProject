from typing import Optional
from pydantic import BaseModel

class UserLogin(BaseModel):
    username: str
    password: str

class UserRegister(UserLogin):
    email: Optional[str] = None

class Recipe(BaseModel):
    name: str
    category: str
    description: Optional[str] = None

class RecipeInfo(Recipe):
    id: int

class Ingredient(BaseModel):
    name: str
    amount: str
    recipe_name: str

class IngredientInfo(Ingredient):
    id: int

class Plan(BaseModel):
    name: str
    recipe_name: str
    recipe_category: str

class PlanInfo(BaseModel):
    id: int