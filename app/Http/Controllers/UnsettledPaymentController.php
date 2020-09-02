<?php

namespace App\Http\Controllers;

use App\Collection;
use Illuminate\Http\Request;

class UnsettledPaymentController extends Controller
{
    /**
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, Collection $collection)
    {
        $payments = $collection->payments()->where('amount', '<>', $collection->perPlayer());
        return view('unsettled-payment.index', compact('collection', 'payments'));
    }
}
