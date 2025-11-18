from typing import List, Optional

from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from sqlalchemy import func
from schemas import Ingredient, IngredientInfo
from models import IngredientModel
from models import RecipeModel
from db import create_session
from logger import logger

router = APIRouter(prefix="/ingredient", tags=["ingredient"])

@router.get('')
def get_ingredients(db: Session = Depends(create_session)):
    ingredients: List[IngredientModel] = db.query(IngredientModel).all()
    logger.debug("Here are all ingredients from DB")
    return [Ingredient(name=ingredient.name, amount=ingredient.amount, recipe_name=ingredient.recipes_name) for ingredient in ingredients]

@router.get('/get_ingredient')
def get_ingredients_for_recipe(recipes_name: str, db: Session = Depends(create_session)) -> Optional[List[Ingredient]]:
    recipe: RecipeModel = db.query(RecipeModel).filter(func.lower(RecipeModel.name) == recipes_name.lower()).first()
    if not recipe:
        logger.error(HTTPException)
        logger.warning(f"Recipe '{recipes_name}' not found")
        raise HTTPException(status_code=404, detail="Recipe not found")

    ingredients: List[IngredientModel] = db.query(IngredientModel).filter(
        func.lower(IngredientModel.recipes_name) == recipes_name.lower()
    ).all()

    if not ingredients:
        logger.error(HTTPException)
        logger.warning(f"No ingredients found for recipe '{recipes_name}'")
        raise HTTPException(status_code=404, detail="No ingredients found for the specified recipe")

    return [Ingredient(name=ingredient.name, amount=ingredient.amount, recipe_name=ingredient.recipes_name) for ingredient in ingredients]