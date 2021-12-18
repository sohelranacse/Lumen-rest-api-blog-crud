<?php

use App\Post;
use Faker\Generator as Faker;

$factory->define(Post::class, function (Faker $faker) {
    return [
        'title' => $this->faker->sentence,
    	'body' => $this->faker->paragraph,
    ];
});