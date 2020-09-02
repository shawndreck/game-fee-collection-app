<?php

namespace Tests\Feature\Http\Controllers;

use App\Collection;
use App\Payment;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use JMac\Testing\Traits\AdditionalAssertions;
use Tests\TestCase;

/**
 * @see \App\Http\Controllers\PaymentController
 */
class PaymentControllerTest extends TestCase
{
    use AdditionalAssertions, RefreshDatabase, WithFaker;

    /**
     * @test
     */
    public function new_displays_view()
    {
        $response = $this->get(route('payment.new'));

        $response->assertOk();
        $response->assertViewIs('payment.new');
        $response->assertViewHas('payment');
    }


    /**
     * @test
     */
    public function store_uses_form_request_validation()
    {
        $this->assertActionUsesFormRequest(
            \App\Http\Controllers\PaymentController::class,
            'store',
            \App\Http\Requests\PaymentStoreRequest::class
        );
    }

    /**
     * @test
     */
    public function store_saves_and_redirects()
    {
        $name = $this->faker->name;
        $amount = $this->faker->word;
        $collection = factory(Collection::class)->create();

        $response = $this->post(route('payment.store'), [
            'name' => $name,
            'amount' => $amount,
            'collection_id' => $collection->id,
        ]);

        $payments = Payment::query()
            ->where('name', $name)
            ->where('amount', $amount)
            ->where('collection_id', $collection->id)
            ->get();
        $this->assertCount(1, $payments);
        $payment = $payments->first();

        $response->assertRedirect(route('payment.new'));
        $response->assertSessionHas('payment.name', $payment->name);
    }
}
