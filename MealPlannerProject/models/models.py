from typing import List

from sqlalchemy import  Integer, String, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, declarative_base, relationship

def safe_get(dct, *keys):
    for key in keys:
        try:
            dct = dct[key]
        except (KeyError, IndexError):
            return None
    return dct

Base = declarative_base()

class UserModel(Base):
    __tablename__ = "user"
    user_id: Mapped[int] = mapped_column(Integer, primary_key=True)
    username: Mapped[str] = mapped_column(String(20), unique=True, nullable=False)
    email: Mapped[str] = mapped_column(String(64), unique=True, nullable=True, default=None)
    hashed_password: Mapped[str] = mapped_column(String(64), nullable=False)

    def __repr__(self) -> str:
        return f"User(username - {self.username})"

class RecipeModel(Base):
    __tablename__ = "recipes"
    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    name: Mapped[str] = mapped_column(String(256), unique=True, nullable=False)
    description: Mapped[str] = mapped_column(String(256), nullable=True)
    category: Mapped[str] = mapped_column(String(64), nullable=False)
    ingredient: Mapped[List["IngredientModel"]] = relationship("IngredientModel", back_populates="recipes")
    plan: Mapped[List["PlanModel"]] = relationship("PlanModel", back_populates="recipes")

    def __repr__(self) -> str:
        return f"Recipe(name - {self.name}, description - {self.description}, category - {self.category})"

class IngredientModel(Base):
    __tablename__ = "ingredient"
    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    name: Mapped[str] = mapped_column(String(64), nullable=False)
    amount: Mapped[str] = mapped_column(String(64), nullable=False)
    recipes_name: Mapped[str] = mapped_column(ForeignKey("recipes.name"), nullable=False)
    recipes: Mapped["RecipeModel"] = relationship("RecipeModel", back_populates="ingredient")

    def __repr__(self) -> str:
        return f"Ingredient(name - {self.name}, amount - {self.amount})"

class PlanModel(Base):
    __tablename__ = "plan"
    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    name: Mapped[str] = mapped_column(String(64), nullable=False)
    recipes_name: Mapped[str] = mapped_column(ForeignKey("recipes.name"), nullable=False)
    recipes_category: Mapped[str] = mapped_column(String(64), nullable=False)
    recipes: Mapped["RecipeModel"] = relationship("RecipeModel", back_populates="plan")

    def __repr__(self) -> str:
        return f"Plan(name - {self.name}, recipe - {self.recipes.name}, category - {self.recipes.category})"