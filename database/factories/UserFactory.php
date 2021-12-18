<?php

use App\User;
use Faker\Generator as Faker;

$factory->define(User::class, function (Faker $faker) {
    return [
        'name' => $this->faker->name,
    	'email' => $this->faker->unique()->safeEmail,
        'password' => app('hash')->make('123456')
    ];
});