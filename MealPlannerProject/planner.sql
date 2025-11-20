CREATE DATABASE  IF NOT EXISTS `planner` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `planner`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: planner
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `amount` varchar(64) NOT NULL,
  `recipes_name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_RecipesIngredient` (`recipes_name`),
  CONSTRAINT `FK_RecipesIngredient` FOREIGN KEY (`recipes_name`) REFERENCES `recipes` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (100,'Eggs','3','Spinach and Feta Egg White Omelet'),(101,'Spinach','1 cup','Spinach and Feta Egg White Omelet'),(102,'Tomato','1/2','Spinach and Feta Egg White Omelet'),(103,'Feta cheese','1 tbsp','Spinach and Feta Egg White Omelet'),(104,'Olive oil','1 tbsp','Spinach and Feta Egg White Omelet'),(105,'Salt','2 g','Spinach and Feta Egg White Omelet'),(106,'Pepper','2 g','Spinach and Feta Egg White Omelet'),(107,'Bread','1 slice','Spinach and Feta Egg White Omelet'),(108,'Greek yogurt','1 cup','High-Protein Greek Yogurt & Berry Bowl'),(109,'Mixed berries','1/2 cup','High-Protein Greek Yogurt & Berry Bowl'),(110,'Chia','1 tbsp','High-Protein Greek Yogurt & Berry Bowl'),(111,'Oats','1/3 cup',' Overnight Oats with Peanut Butter and Banana'),(112,'Almond milk','1/2 cup',' Overnight Oats with Peanut Butter and Banana'),(113,'Peanut butter','1 tbsp',' Overnight Oats with Peanut Butter and Banana'),(114,'Banana','1/2',' Overnight Oats with Peanut Butter and Banana'),(115,'Oats','2 cup','High-Calorie Peanut Banana Oatmeal Bowl'),(116,'Milk','2 cup','High-Calorie Peanut Banana Oatmeal Bowl'),(117,'Soya','1 cup','High-Calorie Peanut Banana Oatmeal Bowl'),(118,'Eggs','2','High-Calorie Peanut Banana Oatmeal Bowl'),(119,'Butter','2 tbsp','High-Calorie Peanut Banana Oatmeal Bowl'),(120,'Vegetable oil','2 tbsp','High-Calorie Peanut Banana Oatmeal Bowl'),(121,'Peanuts','1/4 cup','High-Calorie Peanut Banana Oatmeal Bowl'),(122,'Banana','1','High-Calorie Peanut Banana Oatmeal Bowl'),(123,'Bread','1 slice','Loaded Avocado Toast & Scrambled Eggs'),(124,'Eggs','3','Loaded Avocado Toast & Scrambled Eggs'),(125,'Avocado','1/2','Loaded Avocado Toast & Scrambled Eggs'),(126,'Salmon','1 oz','Loaded Avocado Toast & Scrambled Eggs'),(127,'Butter','1 tbsp','Loaded Avocado Toast & Scrambled Eggs'),(128,'Milk','1 cup','Ultimate Gains Smoothie'),(129,'Greek yogurt','1 cup','Ultimate Gains Smoothie'),(130,'Banana','2','Ultimate Gains Smoothie'),(131,'Oats','1/2 cup','Ultimate Gains Smoothie'),(132,'Honey','1 tbsp','Ultimate Gains Smoothie'),(133,'Chia seeds','1/4 cup','Ultimate Gains Smoothie'),(134,'Berries','1/2 cup','Ultimate Gains Smoothie'),(135,'Peanut butter','2 tbsp','Ultimate Gains Smoothie'),(136,'Eggs','2','The Power Start Scramble & Cottage Cheese Bowl'),(137,'Ham','2 oz','The Power Start Scramble & Cottage Cheese Bowl'),(138,'Cottage cheese','1/2 cup','The Power Start Scramble & Cottage Cheese Bowl'),(139,'Apple','1/2','The Power Start Scramble & Cottage Cheese Bowl'),(140,'Peanut butter','1 tbsp','The Power Start Scramble & Cottage Cheese Bowl'),(141,'Raisins','1 tbsp','The Power Start Scramble & Cottage Cheese Bowl'),(142,'Cinnamon','1 g','The Power Start Scramble & Cottage Cheese Bowl'),(143,'Honey','1 tbsp','The Power Start Scramble & Cottage Cheese Bowl'),(144,'Oats','1 cup','High-Protein Banana Berry Pancakes'),(145,'Banana','1','High-Protein Banana Berry Pancakes'),(146,'Eggs','3','High-Protein Banana Berry Pancakes'),(147,'Milk','1/2 cup','High-Protein Banana Berry Pancakes'),(148,'Whey protein','1 cup','High-Protein Banana Berry Pancakes'),(149,'Baking powder','1 tbsp','High-Protein Banana Berry Pancakes'),(150,'Olive oil','1 tbsp','High-Protein Banana Berry Pancakes'),(151,'Berries','1 cup','High-Protein Banana Berry Pancakes'),(152,'Oats','1/2 cup','Protein Oatmeal Bowl with Toppings'),(153,'Milk','1 cup','Protein Oatmeal Bowl with Toppings'),(154,'Banana','1/2','Protein Oatmeal Bowl with Toppings'),(155,'Peanut butter','1 tbsp','Protein Oatmeal Bowl with Toppings'),(156,'Whey protein','1 cup','Protein Oatmeal Bowl with Toppings'),(157,'Chia seeds','1 tbsp','Protein Oatmeal Bowl with Toppings'),(158,'Cinnamon','1 g','Protein Oatmeal Bowl with Toppings'),(159,'Baby spinach','2 cup','Rainbow Power Salad with Roasted Chickpeas'),(160,'Grapefruit','1','Rainbow Power Salad with Roasted Chickpeas'),(161,'Orange','1','Rainbow Power Salad with Roasted Chickpeas'),(162,'Avocado','1/2','Rainbow Power Salad with Roasted Chickpeas'),(163,'Basil','1/4 cup','Rainbow Power Salad with Roasted Chickpeas'),(164,'Feta cheese','2 oz','Rainbow Power Salad with Roasted Chickpeas'),(165,'Rosdted chickpeas','5 g','Rainbow Power Salad with Roasted Chickpeas'),(166,'Chicken breast','1 cup','Chicken and Veggie Lettuce Wraps'),(167,'Bell pepper','1/2','Chicken and Veggie Lettuce Wraps'),(168,'Carrot','1/2','Chicken and Veggie Lettuce Wraps'),(169,'Celery stalk','1','Chicken and Veggie Lettuce Wraps'),(170,'Hummus','1/8 cup','Chicken and Veggie Lettuce Wraps'),(171,'Lettuce','2','Chicken and Veggie Lettuce Wraps'),(172,'Tuna','1 can','Quick & Easy Tuna and Garbanzo Bean Salad'),(173,'Chickpeas','1/2 cup','Quick & Easy Tuna and Garbanzo Bean Salad'),(174,'Onion','1/4','Quick & Easy Tuna and Garbanzo Bean Salad'),(175,'Lemon juice','1 tbsp','Quick & Easy Tuna and Garbanzo Bean Salad'),(176,'Olive oil','1 tbsp','Quick & Easy Tuna and Garbanzo Bean Salad'),(177,'Basil','2 g','Quick & Easy Tuna and Garbanzo Bean Salad'),(178,'Chicken breast','4 oz','High-Calorie Chicken and Sweet Potato Bowl'),(179,'Sweet potato','1/2','High-Calorie Chicken and Sweet Potato Bowl'),(180,'Olive oil','1 tbsp','High-Calorie Chicken and Sweet Potato Bowl'),(181,'Black beans','1/2 cup','High-Calorie Chicken and Sweet Potato Bowl'),(182,'Avocado','1/4','High-Calorie Chicken and Sweet Potato Bowl'),(183,'Cherry tomatoes','1/4 cup','High-Calorie Chicken and Sweet Potato Bowl'),(184,'Almonds','1 tbsp','High-Calorie Chicken and Sweet Potato Bowl'),(185,'Bread','3 slices','The Ultimate Hearty Meat and Cheese Sandwich'),(186,'Ham','4 slices','The Ultimate Hearty Meat and Cheese Sandwich'),(187,'Cheddar cheese','3 slices','The Ultimate Hearty Meat and Cheese Sandwich'),(188,'Bacon','2 slices','The Ultimate Hearty Meat and Cheese Sandwich'),(189,'Avocado','1/2','The Ultimate Hearty Meat and Cheese Sandwich'),(190,'Mayonnaise','2 g','The Ultimate Hearty Meat and Cheese Sandwich'),(191,'Tomato','4 slices','The Ultimate Hearty Meat and Cheese Sandwich'),(192,'Salmon','4 oz','Salmon and Avocado Salad with Quinoa'),(193,'Quinoa','1 cup','Salmon and Avocado Salad with Quinoa'),(194,'Avocado','1/2','Salmon and Avocado Salad with Quinoa'),(195,'Cherry tomatoes','1/4 cup','Salmon and Avocado Salad with Quinoa'),(196,'Mixed greens','2 cup','Salmon and Avocado Salad with Quinoa'),(197,'Olive oil','2 tbsp','Salmon and Avocado Salad with Quinoa'),(198,'Lemon juice','1 tbsp','Salmon and Avocado Salad with Quinoa'),(199,'Chicken breast','150 g','Cilantro Lime Chicken Bowl'),(200,'Brown rice','1 cup','Cilantro Lime Chicken Bowl'),(201,'Black beans','1/2 cup','Cilantro Lime Chicken Bowl'),(202,'Corn','1/2 cup','Cilantro Lime Chicken Bowl'),(203,'Onion','1/4 cup','Cilantro Lime Chicken Bowl'),(204,'Cilantro','5 g','Cilantro Lime Chicken Bowl'),(205,'Lime','1','Cilantro Lime Chicken Bowl'),(206,'Tuna','1 can','High-Protein Tuna Stuffed Avocado'),(207,'Avocado','2','High-Protein Tuna Stuffed Avocado'),(208,'Greek yogurt','2 tbsp','High-Protein Tuna Stuffed Avocado'),(209,'Onion','1/2','High-Protein Tuna Stuffed Avocado'),(210,'Celery','1','High-Protein Tuna Stuffed Avocado'),(211,'Lemon juice','1 tbsp','High-Protein Tuna Stuffed Avocado'),(212,'Salt','1 g','High-Protein Tuna Stuffed Avocado'),(213,'Bread','2 slices','Lean Turkey and Cheese Power Sandwich'),(214,'Turkey breast','4 slices','Lean Turkey and Cheese Power Sandwich'),(215,'Cheddar cheese','2 slices','Lean Turkey and Cheese Power Sandwich'),(216,'Lettuce','1','Lean Turkey and Cheese Power Sandwich'),(217,'Tomato','2 slices','Lean Turkey and Cheese Power Sandwich'),(218,'Mustard','1 tbsp','Lean Turkey and Cheese Power Sandwich'),(219,'Olive oil','1 tbsp','High-Protein Chicken and Chickpea Skillet'),(220,'Garlic','2 cloves','High-Protein Chicken and Chickpea Skillet'),(221,'Mixed vegetables','2 cup','High-Protein Chicken and Chickpea Skillet'),(222,'Chickpeas','1 can','High-Protein Chicken and Chickpea Skillet'),(223,'Ground cumin','1 tbsp','High-Protein Chicken and Chickpea Skillet'),(224,'Paprika','1 tbsp','High-Protein Chicken and Chickpea Skillet'),(225,'Turkey','1 lb','Turkey Taco Lettuce Wraps'),(226,'Onion','1','Turkey Taco Lettuce Wraps'),(227,'Tomatoes','1 can','Turkey Taco Lettuce Wraps'),(228,'Kidney beans','1 can','Turkey Taco Lettuce Wraps'),(229,'Chili','1 tbsp','Turkey Taco Lettuce Wraps'),(230,'Ground cumin','1 tbsp','Turkey Taco Lettuce Wraps'),(231,'Paprika','1 tbsp','Turkey Taco Lettuce Wraps'),(232,'Lettuce','1','Turkey Taco Lettuce Wraps'),(233,'Salmon','5 oz','Pan-Seared Salmon with Quinoa and Spinach'),(234,'Lemon','1/2','Pan-Seared Salmon with Quinoa and Spinach'),(235,'Quinoa','1 cup','Pan-Seared Salmon with Quinoa and Spinach'),(236,'Baby spinach','1 cup','Pan-Seared Salmon with Quinoa and Spinach'),(237,'Cucumber','1/2','Pan-Seared Salmon with Quinoa and Spinach'),(238,'Avocado','1/2','Pan-Seared Salmon with Quinoa and Spinach'),(239,'Olive oil','1 tbsp','Pan-Seared Salmon with Quinoa and Spinach'),(240,'Pasta','1 cup','High-Calorie Protein Pasta'),(241,'Butter','1 tbsp','High-Calorie Protein Pasta'),(242,'Onion','1/2','High-Calorie Protein Pasta'),(243,'Pepper','1','High-Calorie Protein Pasta'),(244,'Chicken breast','1/2','High-Calorie Protein Pasta'),(245,'Broccoli','1/4 cup','High-Calorie Protein Pasta'),(246,'Heavy cream','1/2 cup','High-Calorie Protein Pasta'),(247,'Parmesan','1/4 cup','High-Calorie Protein Pasta'),(248,'Garlic','5 g','High-Calorie Protein Pasta'),(249,'Paprika','1/2 tbsp','High-Calorie Protein Pasta'),(250,'Oregano','1/2 tbsp','High-Calorie Protein Pasta'),(251,'Basil','1/2 tbsp','High-Calorie Protein Pasta'),(252,'Black pepper','1/2 tbsp','High-Calorie Protein Pasta'),(253,'Beef','2 lbs','Chimichurri Rice Bowls'),(254,'Rice','4 cup','Chimichurri Rice Bowls'),(255,'Sweet potatoes','2','Chimichurri Rice Bowls'),(256,'Broccoli','1 lb','Chimichurri Rice Bowls'),(257,'Olive oil','4 tbsp','Chimichurri Rice Bowls'),(258,'Cilantro','1/4 cup','Chimichurri Rice Bowls'),(259,'Parsley','1/4 cup','Chimichurri Rice Bowls'),(260,'Oregano','1 tbsp','Chimichurri Rice Bowls'),(261,'Garlic','5 g','Chimichurri Rice Bowls'),(262,'Shallot','2 tbsp','Chimichurri Rice Bowls'),(263,'Wine vinegar','1/4 cup','Chimichurri Rice Bowls'),(264,'Beef','2 lbs','Deconstructed Cheeseburger Bowls'),(265,'Potatoes','10','Deconstructed Cheeseburger Bowls'),(266,'Brussels sprouts','9 oz','Deconstructed Cheeseburger Bowls'),(267,'Cheese','5 g','Deconstructed Cheeseburger Bowls'),(268,'BBQ sauce','10 tbsp','Deconstructed Cheeseburger Bowls'),(269,'Tomatoes','2','Deconstructed Cheeseburger Bowls'),(270,'Pickle spears','5','Deconstructed Cheeseburger Bowls'),(271,'Olive oil ','3 tbsp','Deconstructed Cheeseburger Bowls'),(272,'Garlic','5 g','Deconstructed Cheeseburger Bowls'),(273,'Chicken breast','1 lb','High-Protein Chicken and Veggie Power Bowl'),(274,'Mixed vegetables','4 cup','High-Protein Chicken and Veggie Power Bowl'),(275,'Brown rice','2 cup','High-Protein Chicken and Veggie Power Bowl'),(276,'Teriyaki sauce','1/4 cup','High-Protein Chicken and Veggie Power Bowl'),(277,'Olive oil','1 tbsp','High-Protein Chicken and Veggie Power Bowl'),(278,'Beef','500 g','Cheesy Mince Pasta'),(279,'Tortiglioni pasta','320 g','Cheesy Mince Pasta'),(280,'Onion','1','Cheesy Mince Pasta'),(281,'Mushrooms','120 g','Cheesy Mince Pasta'),(282,'Garlic','2','Cheesy Mince Pasta'),(283,'Tomatoes','1 can','Cheesy Mince Pasta'),(284,'Cream cheese','2 tbsp','Cheesy Mince Pasta'),(285,'Cheddar cheese','60 g','Cheesy Mince Pasta'),(286,'Olive oil','1 tbsp','Cheesy Mince Pasta'),(287,'Oregano','1 tbsp','Cheesy Mince Pasta'),(288,'Shrimp','2 cup','Protein-Packed Shrimp and Quinoa Skillet'),(289,'Quinoa','1 cup','Protein-Packed Shrimp and Quinoa Skillet'),(290,'Tomato','1','Protein-Packed Shrimp and Quinoa Skillet'),(291,'Zucchini','1','Protein-Packed Shrimp and Quinoa Skillet'),(292,'Spinach','1 cup','Protein-Packed Shrimp and Quinoa Skillet'),(293,'Garlic','3','Protein-Packed Shrimp and Quinoa Skillet'),(294,'Mozzarella cheese','1/3 cup','Protein-Packed Shrimp and Quinoa Skillet'),(295,'Olive oil','1 tbsp','Protein-Packed Shrimp and Quinoa Skillet');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `recipes_name` varchar(256) NOT NULL,
  `recipes_category` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_RecipesPlan` (`recipes_name`),
  CONSTRAINT `FK_RecipesPlan` FOREIGN KEY (`recipes_name`) REFERENCES `recipes` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,'Weight loss','Spinach and Feta Egg White Omelet','Breakfast'),(2,'Weight loss','High-Protein Greek Yogurt & Berry Bowl','Breakfast'),(3,'Weight loss',' Overnight Oats with Peanut Butter and Banana','Breakfast'),(4,'Weight gain','High-Calorie Peanut Banana Oatmeal Bowl','Breakfast'),(5,'Weight gain','Loaded Avocado Toast & Scrambled Eggs','Breakfast'),(6,'Weight gain','Ultimate Gains Smoothie','Breakfast'),(7,'Muscle gain','The Power Start Scramble & Cottage Cheese Bowl','Breakfast'),(8,'Muscle gain','High-Protein Banana Berry Pancakes','Breakfast'),(9,'Muscle gain','Protein Oatmeal Bowl with Toppings','Breakfast'),(10,'Weight loss','Rainbow Power Salad with Roasted Chickpeas','Lunch'),(11,'Weight loss','Chicken and Veggie Lettuce Wraps','Lunch'),(12,'Weight loss','Quick & Easy Tuna and Garbanzo Bean Salad','Lunch'),(13,'Weight gain','High-Calorie Chicken and Sweet Potato Bowl','Lunch'),(14,'Weight gain','The Ultimate Hearty Meat and Cheese Sandwich','Lunch'),(15,'Weight gain','Salmon and Avocado Salad with Quinoa','Lunch'),(16,'Muscle gain','Cilantro Lime Chicken Bowl','Lunch'),(17,'Muscle gain','High-Protein Tuna Stuffed Avocado','Lunch'),(18,'Muscle gain','Lean Turkey and Cheese Power Sandwich','Lunch'),(19,'Weight loss','High-Protein Chicken and Chickpea Skillet','Dinner'),(20,'Weight loss','Turkey Taco Lettuce Wraps','Dinner'),(21,'Weight loss','Pan-Seared Salmon with Quinoa and Spinach','Dinner'),(22,'Weight gain','High-Calorie Protein Pasta','Dinner'),(23,'Weight gain','Chimichurri Rice Bowls','Dinner'),(24,'Weight gain','Deconstructed Cheeseburger Bowls','Dinner'),(25,'Muscle gain','High-Protein Chicken and Veggie Power Bowl','Dinner'),(26,'Muscle gain','Cheesy Mince Pasta','Dinner'),(27,'Muscle gain','Protein-Packed Shrimp and Quinoa Skillet','Dinner');
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `category` varchar(64) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (10,'Spinach and Feta Egg White Omelet','Breakfast','Quick, protein-rich omelet is a great low-calorie option that incorporates plenty of vegetables'),(11,'High-Protein Greek Yogurt & Berry Bowl','Breakfast','No-cook recipe is perfect for busy mornings and can be prepped the night before'),(12,' Overnight Oats with Peanut Butter and Banana','Breakfast','Oats provide slow-release energy and are packed with fiber, which boosts feelings of fullness'),(13,'High-Calorie Peanut Banana Oatmeal Bowl','Breakfast','Provides a mix of complex carbs, protein and healthy fats, making it a robust meal to start your day'),(14,'Loaded Avocado Toast & Scrambled Eggs','Breakfast','Combines healthy fats from avocado and salmon, quality protein from eggs, and sustained energy from whole-grain bread for a nutrient-dense option'),(15,'Ultimate Gains Smoothie','Breakfast','Quick, on-the-go meal replacement, packed with calories from whole milk, Greek yogurt, peanut butter, and oats'),(16,'The Power Start Scramble & Cottage Cheese Bowl','Breakfast','Combines quick scrambled eggs with cottage cheese and fruit for a sweet and savory meal with over 35g of protein'),(17,'High-Protein Banana Berry Pancakes','Breakfast','These pancakes use oats and protein powder for a muscle-building twist on a classic breakfast'),(18,'Protein Oatmeal Bowl with Toppings','Breakfast','A warm bowl of protein oatmeal, combining complex carbs for sustained energy with protein for muscle health'),(19,'Rainbow Power Salad with Roasted Chickpeas','Lunch','This salad is low-GI, packed with superfoods, and highly satisfying'),(20,'Chicken and Veggie Lettuce Wraps','Lunch','These wraps are a light, low-carb alternative to traditional sandwiches, with plenty of protein and fresh flavors'),(21,'Quick & Easy Tuna and Garbanzo Bean Salad','Lunch','This no-mayo salad is high in protein and fiber, making it a filling and simple lunch option that requires minimal cooking'),(22,'High-Calorie Chicken and Sweet Potato Bowl','Lunch','This bowl is packed with lean protein, complex carbohydrates, and healthy fats, making it ideal for fueling an active lifestyle'),(23,'The Ultimate Hearty Meat and Cheese Sandwich','Lunch','This substantial sandwich is a variation of a club-style sandwich, stacked high with various proteins and rich ingredients to ensure a high-calorie count'),(24,'Salmon and Avocado Salad with Quinoa','Lunch','Provides a good source of healthy fats, along with complex carbohydrates for sustained energy and weight gain'),(25,'Cilantro Lime Chicken Bowl','Lunch','Simple, flavorful, and excellent for meal prepping, providing a balanced mix of protein, carbs, and vegetables'),(26,'High-Protein Tuna Stuffed Avocado','Lunch','Quick, requires no cooking, and is high in healthy fats and protein, making it a perfect light yet satisfying lunch'),(27,'Lean Turkey and Cheese Power Sandwich','Lunch','A classic, easy-to-assemble sandwich packed with lean protein and carbohydrates for sustained energy'),(28,'High-Protein Chicken and Chickpea Skillet','Dinner','This one-skillet meal is easy to prepare and packed with lean protein and fiber, making it very filling without being heavy'),(29,'Turkey Taco Lettuce Wraps','Dinner','A light and low-carb alternative to traditional tacos, these wraps use lean ground turkey and fresh lettuce leaves'),(30,'Pan-Seared Salmon with Quinoa and Spinach','Dinner','Rich in healthy omega-3 fatty acids and high in protein, making it excellent for satiety and overall health'),(31,'High-Calorie Protein Pasta','Dinner','Creamy pasta dish is packed with protein and heavy cream for healthy weight gain'),(32,'Chimichurri Rice Bowls','Dinner','Flavorful and easy-to-prep meal combines ground beef, rice, and vegetables with a zesty chimichurri sauce'),(33,'Deconstructed Cheeseburger Bowls','Dinner','Combines ground beef, potato wedges, and a tangy BBQ sauce for a satisfying, high-calorie meal'),(34,'High-Protein Chicken and Veggie Power Bowl','Dinner','Complete meal with lean protein, complex carbohydrates, and plenty of vegetables, perfect for recovery and sustained energy'),(35,'Cheesy Mince Pasta','Dinner','Satisfying, carb-loading meal for intense training days, uses lean beef mince to deliver a substantial protein boost'),(36,'Protein-Packed Shrimp and Quinoa Skillet','Dinner','Combines quality protein from shrimp along with fresh vegetables for a light yet filling dinner');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `hashed_password` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'flavius','flavius@yahoo.com','12345'),(10,'alex','alex@yahoo.com','$2b$12$XDfCIVDlSylKcL1qlH5kduzpcdpci38owdvh2KLKgLl4MXx4Hoaze'),(11,'Ion','ion@yahoo.com','$2b$12$/lnOou3y0ZdyRuvXLEy34uebaCQj4yPwLNVKPR2YY.JLK4AC.c6NC'),(12,'Sofia',NULL,'$2b$12$.NpZjpwhijHpkw3iX7e0cOL9tj9PxkBDayK3Mc7sLUVTnAVdV0G0.'),(13,'matei',NULL,'$2b$12$PYjIR4S10cABrNWiIu0VIOc.oD8ohgFgES0sOnWzeuGsvMY7LLBwi'),(14,'mateiw',NULL,'$2b$12$QElVI0/0d6EwrLZSgxehpOhnV/rmnFQlvlFJeAvWZmnq2a13w5IGy');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-20 13:17:17
