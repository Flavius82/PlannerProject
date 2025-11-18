import streamlit as st
import requests


st.title("Meal Planner")

FASTAPI_URL = "http://api:8000"

st.header("User Registration")
new_user = st.text_input("Please enter a new username for registration:", key="register_username")
hashed_password = st.text_input("Please enter a password for registration:", type="password", key="register_password")
if st.button("Register"):
    response = requests.post(f"{FASTAPI_URL}/auth/register", json={
        "username": new_user, "password": hashed_password})
    if response.status_code == 200:
        st.success("Registration successful!")
    else:
        st.error(f"Registration failed: {response.json().get('detail', 'Unknown error')}")

st.header("User Login")
login_user = st.text_input("Please enter your username for login:", key="login_username")
login_password = st.text_input("Please enter your password for login:", type="password", key="login_password")
if st.button("Login"):
    response = requests.post(f"{FASTAPI_URL}/auth/login", json={
        "username": login_user, "password": login_password})
    if response.status_code == 200:
        st.success("Login successful!")
    else:
        st.error(f"Login failed: {response.json().get('detail', 'Unknown error')}")

st.header("Get Recipes")
if st.button("Get Recipes"):
    response = requests.get(f"{FASTAPI_URL}/recipes/")
    if response.status_code == 200:
        recipes = response.json()
        for recipe in recipes:
            st.subheader(recipe["name"])
            st.write(recipe["description"])
    else:
        st.error("Failed to fetch recipes from FastAPI")

st.header("Get Recipe by Name")
recipe_name = st.text_input("Enter Recipe Name:")
if st.button("Get Recipe by Name"):
    if recipe_name:
        try:
            response = requests.get(f"{FASTAPI_URL}/recipes/get_recipeName", params={"recipe_name": recipe_name})
            if response.status_code == 200:
                recipe = response.json()
                st.success(f"Recipe Found: {recipe['name']}")
                st.write(f"Category: {recipe['category']}")
                st.write(f"Description: {recipe['description']}")
            else:
                st.error("Recipe not found.")
        except requests.exceptions.RequestException as e:
            st.error(f"Error connecting to FastAPI backend: {e}")
    else:
        st.warning("Please enter a recipe name.")

st.header("Get Recipe by Category")
recipe_category = st.text_input("Enter Recipe Category:")
if st.button("Get Recipe by Category"):
    if recipe_category:
        try:
            response = requests.get(f"{FASTAPI_URL}/recipes/get_recipeCategory", params={"recipe_category": recipe_category})
            if response.status_code == 200:
                recipes = response.json()
                if recipes:
                    st.success(f"Recipes in Category: {recipe_category}")
                    st.write(f"Name: {recipes['name']}")
                    st.write(f"Description: {recipes['description']}")
                else:
                    st.error("No recipes found in this category.")
            else:
                st.error("Recipe not found.")
        except requests.exceptions.RequestException as e:
            st.error(f"Error connecting to FastAPI backend: {e}")
    else:
        st.warning("Please enter a recipe category.")

st.header("Get Ingredients")
if st.button("Get Ingredients"):
    response = requests.get(f"{FASTAPI_URL}/ingredient/")
    if response.status_code == 200:
        ingredients = response.json()
        for ingredient in ingredients:
            st.subheader(ingredient["name"])
            st.write(f"Amount: {ingredient['amount']}")
            st.write(f"Recipe_name: {ingredient['recipe_name']}")
    else:
        st.error("Failed to fetch ingredients from FastAPI")

st.header("Get Ingredients for a Recipe")
ingredient_recipe_name = st.text_input("Enter Recipe Name for Ingredients:")
if st.button("Get Ingredients by Recipe Name"):
    try:
        payload = {"recipes_name": ingredient_recipe_name}
        response = requests.get(f"{FASTAPI_URL}/ingredient/get_ingredient", params=payload)
        if response.status_code == 200:
            ingredients_list = response.json()
            st.success(f"Ingredients for Recipe: {ingredient_recipe_name}")
            for ingredient in ingredients_list:
                st.write(f"Name: {ingredient['name']}, Amount: {ingredient['amount']}, Recipe Name: {ingredient['recipe_name']}")
        else:
            st.error("No ingredients found for this recipe.")
    except requests.exceptions.RequestException as e:
        st.error(f"Error connecting to FastAPI backend: {e}")

st.header("Get Plans")
if st.button("Get Plans"):
    response = requests.get(f"{FASTAPI_URL}/plan/")
    if response.status_code == 200:
        plans = response.json()
        for plan in plans:
            st.subheader(plan["name"])
            st.write(f"Recipe Name: {plan['recipe_name']}")
            st.write(f"Recipe Category: {plan['recipe_category']}")
    else:
        st.error("Failed to fetch plans from FastAPI")

st.header("Get Recipes by Plan Name and Category")
plan_name = st.text_input("Enter Plan Name:")
recipes_category = st.text_input("Enter Recipe Category:", key="plan_recipe_category")
if st.button("Get Recipes by Plan Name and Category"):
    if plan_name and recipes_category:
        try:
            response = requests.get(f"{FASTAPI_URL}/plan/get_plan", params={"plan_name": plan_name, "recipes_category": recipes_category})
            if response.status_code == 200:
                plans = response.json()
                st.success(f"Plans Found for: {plan_name} and Category: {recipes_category}")
                plans_data = [f"Name: {plan['name']}, Recipe Name: {plan['recipe_name']}, Recipe Category: {plan['recipe_category']}" for plan in plans]
                st.dataframe(plans_data)
            else:
                st.error("No plans found matching the criteria.")
        except requests.exceptions.RequestException as e:
            st.error(f"Error connecting to FastAPI backend: {e}")
    else:
        st.warning("Please enter both plan name and recipe category.")
