<?php

namespace Tests\Feature\Http\Controllers;

use Illuminate\Foundation\Testing\WithFaker;
use JMac\Testing\Traits\AdditionalAssertions;
use Tests\TestCase;

/**
 * @see \App\Http\Controllers\CollectionController
 */
class CollectionControllerTest extends TestCase
{
    use AdditionalAssertions, WithFaker;

    /**
     * @test
     */
    public function new_displays_view()
    {
        $response = $this->get(route('collection.new'));

        $response->assertOk();
        $response->assertViewIs('collection.new');
    }


    /**
     * @test
     */
    public function store_uses_form_request_validation()
    {
        $this->assertActionUsesFormRequest(
            \App\Http\Controllers\CollectionController::class,
            'store',
            \App\Http\Requests\CollectionStoreRequest::class
        );
    }

    /**
     * @test
     */
    public function store_behaves_as_expected()
    {
        $amount = $this->faker->numberBetween(-10000, 10000);
        $players = $this->faker->numberBetween(-10000, 10000);

        $response = $this->post(route('collection.store'), [
            'amount' => $amount,
            'players' => $players,
        ]);
    }
}
