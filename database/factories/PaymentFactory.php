<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Payment;
use Faker\Generator as Faker;

$factory->define(Payment::class, function (Faker $faker) {
    return [
        'collection_id' => factory(\App\Collection::class),
        'name' => $faker->name,
        'amount' => $faker->word,
    ];
});
