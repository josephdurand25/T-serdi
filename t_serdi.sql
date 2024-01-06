-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 06 jan. 2024 à 15:19
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `t_serdi`
--
CREATE DATABASE IF NOT EXISTS `t_serdi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `t_serdi`;

-- --------------------------------------------------------

--
-- Structure de la table `abouts`
--

DROP TABLE IF EXISTS `abouts`;
CREATE TABLE IF NOT EXISTS `abouts` (
  `id_about` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `about_id_gear` int NOT NULL,
  `img_about` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_about`),
  KEY `abouts_about_id_gear_foreign` (`about_id_gear`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `abouts`
--

INSERT INTO `abouts` (`id_about`, `about_id_gear`, `img_about`, `text_about`, `published`, `created_at`, `updated_at`) VALUES
(1, 1, 'storage/utilities/about/about-img.jpg', '(Système d\'Identification et de Sécurisation des activités de moto-taxi) Système qui permet l\'identification des opérateurs de cette activité(opérateurs, conducteur, moto, ...) et la sécurité des activités de transport par moto-taxi des usagers. Sort l\'activité de l\'informel vers le formel.', 1, '2024-01-02 05:34:38', '2024-01-02 06:21:32');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `id_produit` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `produit_id_gear` bigint NOT NULL,
  `intitule` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_produit` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_produit`),
  KEY `produits_produit_id_gear_foreign` (`produit_id_gear`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id_produit`, `produit_id_gear`, `intitule`, `description`, `img_produit`, `published`, `created_at`, `updated_at`) VALUES
(1, 1, 'SISAMOT', '(Système d\'Identification et de Sécurisation des activités de moto-taxi) Système qui permet l\'identification des opérateurs de cette activité(opérateurs, conducteur, moto, ...) et la sécurité des activités de transport par moto-taxi des usagers. Sort l\'activité de l\'informel vers le formel.', 'storage/utilities/produit/SISAMOT.jpg', 1, '2024-01-02 21:55:34', '2024-01-02 21:55:34'),
(2, 1, 'SERDITRANSPORT', 'Logiciel de gestion de transport de personnes et de biens par autocars controlant toutes la logistique et méssagerie. Ventes de billets, réservations avec confirmation, productions de manifestes, les statistiques de l\'activité,...', 'storage/utilities/produit/SERDITRANSPORT.jpg', 1, '2024-01-03 07:27:00', '2024-01-03 07:27:00'),
(3, 1, 'GESCO', '(Gestion scolaire) Logiciel informatique spécialisé dans la gestion académique des universités et grandes écoles. Il permet la prise en charge de l\'étudiant, de l\'inscription jusqu\'à la fin de ses études.', 'storage/utilities/produit/GESCO.jpg', 1, '2024-01-03 07:27:55', '2024-01-03 07:27:55'),
(4, 1, 'SERDICOURRIER', 'Système de gestion de courrier pour administrations, collectivités térritoriales et les professionnelles. Suivi de la réception du courrier jusqu\'à la réponse( toutes les étapes sont prises en compte)', 'storage/utilities/produit/SERDICOURRIER.jpeg', 1, '2024-01-03 07:30:46', '2024-01-03 07:30:46'),
(5, 1, 'DIKAKI', 'En cour...', 'storage/utilities/produit/DIKAKI.png', 1, '2024-01-03 07:33:06', '2024-01-03 07:33:06');

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id_service` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `service_id_gear` int NOT NULL,
  `intitule` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_service` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_service`),
  KEY `services_service_id_gear_foreign` (`service_id_gear`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`id_service`, `service_id_gear`, `intitule`, `description`, `img_service`, `published`, `created_at`, `updated_at`) VALUES
(1, 1, 'Développement applications web & mobile', 'Notre métier est de développer pour vous des applications multiplateformes plus vite. Les rendre pratiques, intuitives et réactives est votre exigence.', 'storage/utilities/service/Développement applications web & mobile.jpeg', 1, '2024-01-03 07:21:14', '2024-01-03 07:21:14'),
(2, 1, 'Infogérance & hébergement web', 'Nous vous offrons notre assitance dans la création de site internet personnalisé ainsi que nos services d\'hergement. Vous bénéficiez également de nos conseils pour tout autre service internet.', 'storage/utilities/service/Infogérance & hébergement web.jpeg', 1, '2024-01-03 07:23:28', '2024-01-03 07:23:28'),
(3, 1, 'Développement logiciels spécifiques', 'Spécialiste de l\'informatique, Nous développons pour vous des solutions logicielles de bureau adaptées à vos activités et selon vos préférences.', 'storage/utilities/service/Développement logiciels spécifiques.png', 1, '2024-01-03 07:24:06', '2024-01-03 07:24:06'),
(4, 1, 'Formations personnalisées conseils', 'Notre mettons à la disposition du public des formations personnalisées dans les domaines de l\'ingénierie informatique selon votre disponibilité.', 'storage/utilities/service/Formations personnalisées conseils.jpeg', 1, '2024-01-03 07:25:11', '2024-01-03 07:25:11');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id_gear` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slogan` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galerie` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_gear`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id_gear`, `name`, `slogan`, `email`, `address`, `logo`, `galerie`, `created_at`, `updated_at`) VALUES
(1, 'SERDI Cameroun', 'Nous rencontrer, c\'est avancer !', 'durandjosephadji25@gmail.com', 'Bali carrefour kayéoli', 'storage/utilities/setting/icons8_question_mark.ico', 'storage/utilities/setting/icons8_questions_32px.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vues`
--

DROP TABLE IF EXISTS `vues`;
CREATE TABLE IF NOT EXISTS `vues` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `vue_id_gear` int NOT NULL,
  `name_view` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ico_view` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_page` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_folder` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vues_vue_id_gear_foreign` (`vue_id_gear`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vues`
--

INSERT INTO `vues` (`id`, `vue_id_gear`, `name_view`, `ico_view`, `view_page`, `view_folder`, `published`, `created_at`, `updated_at`) VALUES
(1, 1, 'abouts', 'fa-circle-info', 'index', 'abouts', 1, NULL, NULL),
(10, 1, 'produits', 'fa-product-hunt', 'index', 'produits', 1, NULL, NULL),
(5, 1, 'services', 'fa-servicestack', 'index', 'services', 1, NULL, NULL),
(6, 1, 'settings', 'fa-cogs', 'index', 'settings', 1, NULL, NULL),
(7, 1, 'vues', 'fa-link', 'index', 'vues', 1, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;