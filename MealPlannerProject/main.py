from fastapi import FastAPI
from routers import auth_router
from routers import recipes_router
from routers import ingredient_router
from routers import plan_router


app = FastAPI()
app.include_router(auth_router)
app.include_router(recipes_router)
app.include_router(ingredient_router)
app.include_router(plan_router)