CREATE TABLE IF NOT EXISTS `elevators`
(
    `id`             INT AUTO_INCREMENT,
    `max_passengers` INT,
    `max_load`       INT,
    `max_speed`      INT,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `floors`
(
    `id`     INT AUTO_INCREMENT,
    `zone`   INT NULL,
    `number` INT,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `doors`
(
    `id`           INT AUTO_INCREMENT,
    `floor_id`     INT,
    `open_timing`  INT NULL,
    `close_timing` INT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`floor_id`) REFERENCES `floors` (`id`)
);

CREATE TABLE IF NOT EXISTS `events`
(
    `id`                 INT AUTO_INCREMENT,
    `elevator_id`        INT         NULL,
    `door_id`            INT         NULL,
    `floor_id`           INT         NULL,
    `parent_event_id`    INT         NULL,
    `event_type`         varchar(50),
    `created_at`         TIMESTAMP,
    `count_people`       INT         NULL,
    `next_stop_floor_id` INT         NULL,
    `elevator_direction` varchar(50) NULL,
    `door_state`         varchar(50) NULL,
    `elevator_state`     varchar(50) NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`floor_id`) REFERENCES `floors` (`id`),
    FOREIGN KEY (`door_id`) REFERENCES `doors` (`id`),
    FOREIGN KEY (`elevator_id`) REFERENCES `elevators` (`id`),
    FOREIGN KEY (`next_stop_floor_id`) REFERENCES `floors` (`id`)
);

