/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int NOT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurants` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Spaghetti Bolognese', 'spaghetti_bolognese.jpg', 12.99, 'Classic Italian pasta dish with meat sauce.', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Tacos', 'tacos.jpg', 8.99, 'Traditional Mexican street food with various fillings.', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Sushi Combo', 'sushi_combo.jpg', 22.5, 'Assorted sushi rolls and sashimi.', 3);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Vegetarian Pizza', 'vegetarian_pizza.jpg', 15.5, 'Pizza topped with a variety of fresh vegetables.', 4),
(5, 'Grilled Salmon', 'grilled_salmon.jpg', 18.75, 'Salmon fillet grilled to perfection.', 5),
(6, 'Ribeye Steak', 'ribeye_steak.jpg', 29.99, 'Juicy and flavorful ribeye steak.', 6),
(7, 'Caprese Salad', 'caprese_salad.jpg', 9.75, 'Fresh tomato, mozzarella, and basil salad.', 1),
(8, 'Enchiladas', 'enchiladas.jpg', 11.25, 'Rolled tortillas filled with meat and covered in sauce.', 2),
(9, 'Tempura Udon', 'tempura_udon.jpg', 13.5, 'Udon noodles with tempura (battered and fried seafood or vegetables).', 3),
(10, 'Quinoa Salad', 'quinoa_salad.jpg', 10.99, 'Healthy salad with quinoa, vegetables, and vinaigrette dressing.', 4),
(11, 'Seafood Paella', 'seafood_paella.jpg', 25.5, 'Spanish dish with rice and a variety of seafood.', 5),
(12, 'New York Strip Steak', 'ny_strip_steak.jpg', 32.5, 'Premium cut of New York strip steak.', 6),
(13, 'Margherita Pizza', 'margherita_pizza.jpg', 14.5, 'Classic pizza with tomato, mozzarella, and basil.', 1),
(14, 'Burrito Bowl', 'burrito_bowl.jpg', 9.99, 'Burrito ingredients served in a bowl for a convenient meal.', 2),
(15, 'Dragon Roll', 'dragon_roll.jpg', 18.99, 'Sushi roll with eel, avocado, and eel sauce.', 3);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Italian');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Mexican');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Japanese');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Vegetarian'),
(5, 'Seafood'),
(6, 'Steakhouse');

INSERT INTO `like_res` (`id`, `user_id`, `res_id`, `date_like`) VALUES
(1, 1, 2, '2023-01-01 08:45:00');
INSERT INTO `like_res` (`id`, `user_id`, `res_id`, `date_like`) VALUES
(2, 3, 4, '2023-01-02 10:20:00');
INSERT INTO `like_res` (`id`, `user_id`, `res_id`, `date_like`) VALUES
(3, 2, 1, '2023-01-03 12:15:00');
INSERT INTO `like_res` (`id`, `user_id`, `res_id`, `date_like`) VALUES
(4, 5, 3, '2023-01-04 14:30:00'),
(5, 4, 6, '2023-01-05 16:45:00'),
(6, 1, 2, '2023-01-01 08:45:00'),
(7, 3, 4, '2023-01-02 10:20:00'),
(8, 2, 1, '2023-01-03 12:15:00'),
(9, 5, 3, '2023-01-04 14:30:00'),
(10, 4, 6, '2023-01-05 16:45:00'),
(11, 1, 8, '2023-01-06 18:10:00'),
(12, 3, 7, '2023-01-07 20:25:00'),
(13, 2, 5, '2023-01-08 22:40:00'),
(14, 4, 3, '2023-01-09 09:15:00'),
(15, 5, 2, '2023-01-10 11:30:00'),
(16, 1, 4, '2023-01-11 13:45:00'),
(17, 3, 6, '2023-01-12 15:00:00'),
(18, 2, 8, '2023-01-13 17:15:00'),
(19, 4, 1, '2023-01-14 19:30:00'),
(20, 5, 7, '2023-01-15 21:45:00'),
(21, 1, 5, '2023-01-16 23:00:00'),
(22, 3, 2, '2023-01-17 09:30:00'),
(23, 2, 8, '2023-01-18 11:45:00'),
(24, 4, 4, '2023-01-19 14:00:00');

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 'ORDER123', '1,2');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 5, 1, 'ORDER456', '5');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 9, 3, 'ORDER789', '9,10,11');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(4, 14, 2, 'ORDERABC', '14,15'),
(5, 3, 1, 'ORDERDEF', '3'),
(1, 6, 2, 'ORDERGHI', '6,7'),
(2, 12, 1, 'ORDERJKL', '12'),
(3, 4, 3, 'ORDERMNO', '4,5,8'),
(4, 10, 2, 'ORDERPQR', '10,11'),
(5, 2, 1, 'ORDERSTU', '2'),
(1, 8, 2, 'ORDERVWX', '8,9'),
(2, 11, 1, 'ORDERYZA', '11'),
(3, 13, 3, 'ORDERBCD', '13,14,15'),
(4, 6, 2, 'ORDEREFG', '6,7'),
(5, 7, 1, 'ORDERHIJ', '7'),
(1, 10, 2, 'ORDERKLM', '10,11'),
(2, 14, 1, 'ORDERNOP', '14'),
(3, 15, 3, 'ORDERQRS', '15,10,11'),
(4, 3, 2, 'ORDERTUV', '3,4');

INSERT INTO `rate_res` (`id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 2, 4, '2023-01-01 12:30:00');
INSERT INTO `rate_res` (`id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 4, 5, '2023-01-02 15:45:00');
INSERT INTO `rate_res` (`id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 3, 1, 3, '2023-01-03 18:20:00');
INSERT INTO `rate_res` (`id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 4, 3, 4, '2023-01-04 21:10:00'),
(5, 5, 6, 5, '2023-01-05 14:00:00'),
(6, 6, 8, 4, '2023-01-06 17:30:00'),
(7, 7, 5, 3, '2023-01-07 20:15:00');

INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Restaurant A', 'restaurant_a.jpg', 'A cozy place with a diverse menu.');
INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'Restaurant B', 'restaurant_b.jpg', 'Specializing in local and organic ingredients.');
INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Restaurant C', 'restaurant_c.jpg', 'Family-friendly atmosphere with a kids menu.');
INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `description`) VALUES
(4, 'Restaurant D', 'restaurant_d.jpg', 'Famous for its chef\'s specials and unique flavors.'),
(5, 'Restaurant E', 'restaurant_e.jpg', 'A trendy spot with a modern and stylish interior.'),
(6, 'Restaurant F', 'restaurant_f.jpg', 'Known for its live music and entertainment.'),
(7, 'Restaurant G', 'restaurant_g.jpg', 'Traditional cuisine with a modern twist.'),
(8, 'Restaurant H', 'restaurant_h.jpg', 'Panoramic views and outdoor seating.');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Garlic Bread', 3.99, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Guacamole', 2.5, 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Miso Soup', 1.99, 3);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Bruschetta', 4.25, 7),
(5, 'Churros', 3.75, 8),
(6, 'Edamame', 2.99, 9),
(7, 'Caesar Salad', 5.5, 10),
(8, 'Calamari', 6.99, 11),
(9, 'Cheesecake', 7.5, 12);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'John Doe', 'john.doe@email.com', 'password123');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Jane Smith', 'jane.smith@email.com', 'securepassword');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Bob Johnson', 'bob.johnson@email.com', 'mypassword');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Alice Williams', 'alice.williams@email.com', 'p@ssw0rd'),
(5, 'Charlie Brown', 'charlie.brown@email.com', 'brownie123'),
(6, 'Emma Davis', 'emma.davis@email.com', 'ilovecoding'),
(7, 'Michael Miller', 'michael.miller@email.com', 'miller123'),
(8, 'Olivia Taylor', 'olivia.taylor@email.com', 'taylorpass'),
(9, 'David Wilson', 'david.wilson@email.com', 'wilson321'),
(10, 'Sophia Lee', 'sophia.lee@email.com', 'leesophia');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;