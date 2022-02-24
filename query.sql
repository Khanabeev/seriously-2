CREATE TABLE `elevators` (
  `id` int,
  `max_passengers` int,
  `max_load` int,
  `max_speed` int,
  PRIMARY KEY (`id`)
);

CREATE TABLE `doors` (
  `id` int,
  `floor_id` int,
  `open_timing` int,
  `close_timing` int,
  PRIMARY KEY (`id`)
);

CREATE TABLE `floors` (
  `id` int,
  `zone` int,
  `number` int,
  PRIMARY KEY (`id`)
);

CREATE TABLE `events` (
  `id` int,
  `elevator_id` int,
  `door_id` int,
  `floor_id` int,
  `parent_event_id` int,
  `event_type` enum,
  `timestamp` unix_timestamp,
  `count_people` int,
  `next_stop_floor_id` int,
  `elevator_direction` enum,
  `door_state` enum,
  `elevator_state` enum,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`floor_id`) REFERENCES `floors`(`id`),
  FOREIGN KEY (`door_id`) REFERENCES `doors`(`id`),
  FOREIGN KEY (`elevator_id`) REFERENCES `elevators`(`id`),
  FOREIGN KEY (`next_stop_floor_id`) REFERENCES `floors`(`id`)
);

