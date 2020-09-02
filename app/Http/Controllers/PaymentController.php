<?php

namespace App\Http\Controllers;

use App\Collection;
use App\Http\Requests\PaymentStoreRequest;
use App\Payment;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    /**
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function new(Request $request, Collection $collection)
    {
        $payment = new Payment();
        $payment->collection()->associate($collection);

        return view('payment.new', compact('payment', 'collection'));
    }

    /**
     * @param \App\Http\Requests\PaymentStoreRequest $request
     * @return \Illuminate\Http\Response
     */
    public function store(PaymentStoreRequest $request)
    {
        $payment = Payment::create($request->validated());

        $request->session()->flash('payment.name', $payment->name);

        return redirect()->route('payment.new', $payment->collection);
    }
}
