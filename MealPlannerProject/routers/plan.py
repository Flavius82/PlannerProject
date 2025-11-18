from typing import List, Optional

from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from sqlalchemy import func
from schemas import Plan, PlanInfo
from models import PlanModel
from db import create_session
from logger import logger

router = APIRouter(prefix="/plan", tags=["plan"])

@router.get('')
def get_plans(db: Session = Depends(create_session)):
    plans: List[PlanModel] = db.query(PlanModel).all()
    logger.debug("Fetched all plans from the database")
    return [Plan(name=plan.name, recipe_name=plan.recipes_name, recipe_category=plan.recipes_category) for plan in plans]

@router.get('/get_plan')
def get_plan(plan_name: str, recipes_category: str, db: Session = Depends(create_session)) -> List[Plan]:
    plans: List[PlanModel] = db.query(PlanModel).filter(
        func.lower(PlanModel.name) == plan_name.lower(),
        func.lower(PlanModel.recipes_category) == recipes_category.lower()
    ).all()

    if not plans:
        logger.error(HTTPException)
        logger.warning(f"No plans found with name '{plan_name}' and category '{recipes_category}'")
        raise HTTPException(status_code=404, detail="No plans found matching the criteria")

    return [Plan(name=plan.name, recipe_name=plan.recipes_name, recipe_category=plan.recipes_category) for plan in plans]