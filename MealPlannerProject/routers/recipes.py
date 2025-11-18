from typing import List, Optional

from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from sqlalchemy import func
from schemas import Recipe, RecipeInfo
from models import RecipeModel
from db import create_session
from logger import logger

router = APIRouter(prefix="/recipes", tags=["recipes"])

@router.get('')
def get_recipes(db: Session = Depends(create_session)):
    logger.debug("Fetching all recipes from the database")
    recipes: List[RecipeModel] = db.query(RecipeModel).all()
    return [Recipe(name=recipe.name, description=recipe.description, category=recipe.category) for recipe in recipes]

@router.get('/get_recipeName')
def get_recipe(recipe_name: str, db: Session = Depends(create_session)):
    logger.debug(f"Fetching recipe by name '{recipe_name}' from the database")
    recipe: RecipeModel = db.query(RecipeModel).filter(func.lower(RecipeModel.name) == recipe_name.lower()).first()
    if recipe:
        return Recipe(name=recipe.name, description=recipe.description, category=recipe.category)
    logger.error(HTTPException)
    logger.warning(f"Recipe with name '{recipe_name}' not found")
    raise HTTPException(status_code=404, detail="Recipe not found")

@router.get('/get_recipeCategory')
def get_recipe(recipe_category: str, db: Session = Depends(create_session)):
    logger.debug(f"Fetching recipe by category '{recipe_category}' from the database")
    recipe: RecipeModel = db.query(RecipeModel).filter(RecipeModel.category.ilike(f"%{recipe_category}%")).order_by(func.random()).first()
    if recipe:
        logger.debug(f"Recipe found: {recipe.name} in category '{recipe_category}'")
        return Recipe(name=recipe.name, description=recipe.description, category=recipe.category)
    logger.error(HTTPException)
    logger.warning("Recipe not found")
    raise HTTPException(status_code=404, detail="Recipe not found")