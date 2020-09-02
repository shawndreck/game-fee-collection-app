<?php

namespace Tests\Feature\Http\Controllers;

use Tests\TestCase;

/**
 * @see \App\Http\Controllers\UnsettledPaymentController
 */
class UnsettledPaymentControllerTest extends TestCase
{
    /**
     * @test
     */
    public function index_displays_view()
    {
        $response = $this->get(route('unsettled-payment.index'));

        $response->assertOk();
        $response->assertViewIs('unsettled-payment.index');
        $response->assertViewHas('collection');
    }
}
