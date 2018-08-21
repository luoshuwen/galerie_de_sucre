create database gds;
use gds;

create table `users` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `email` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    `name` varchar(255) DEFAULT NULL,
    `is_admin` tinyint(1) DEFAULT '0',
    `tel` varchar(50) default NULL,
    `status` varchar(50) default NULL,
    `avatar` varchar(255) default NULL,
    `birth_date` datetime default NULL,
    `gender` varchar(50) default NULL,
    `bio` varchar(255) default NULL,
    `language` varchar(50) default NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  	`updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  	PRIMARY KEY `pk_users_id` (`id`),
  	unique key `uk_users_email` (`email`),
  	unique key `uk_users_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table `articles` (
	`id` int(11) unsigned not null AUTO_INCREMENT,
	`user_id` int(11) unsigned not null,
	`title` varchar(255) not null,
	`content` text default null,
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  	`updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	primary key `pk_articles_id` (`id`),
	constraint `fk_articles_user_id_users_id` foreign key (`user_id`) references `users` (`id`)
) engine=InnoDB default CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table `comments` (
	`id` int(11) unsigned not null AUTO_INCREMENT,
	`user_id` int(11) unsigned not null,
	`article_id` int(11) unsigned not null,
	`content` text not null,
	`created_at` timestamp not null default CURRENT_TIMESTAMP,
	`updated_at` timestamp not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
	primary key `pk_comments_id` (`id`),
	constraint `fk_comments_user_id_users_id` foreign key (`user_id`) references `users` (`id`),
	constraint `fk_comments_article_id_articles_id` foreign key (`article_id`) references `articles` (`id`)
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table `tags` (
	`id` int(11) unsigned not null AUTO_INCREMENT,
	`name` varchar(50) not null,
	primary key `pk_tags_id` (`id`),
	unique key `uk_tags_name` (`name`)
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table `article_tags` (
	`id` int(11) unsigned not null AUTO_INCREMENT,
	`article_id` int(11) unsigned not null,
	`tag_id` int(11) unsigned not null,
	primary key `pk_article_tags_id` (`id`),
	constraint `fk_article_id_articles_id` foreign key (`article_id`) references `articles` (`id`),
	constraint `fk_tag_id_tags_is` foreign key (`tag_id`) references `tags` (`id`),
	constraint `uk_article_id_tag_id` unique key (`article_id`,`tag_id`)
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_unicode_ci;