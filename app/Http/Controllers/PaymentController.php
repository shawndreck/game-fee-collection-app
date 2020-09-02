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
        $request->session()->flash('success', "$payment->name paid");
        return redirect()->route('payment.new', $payment->collection);
    }
    public function edit(Payment $payment)
    {
        $collection = $payment->collection;
        return view('payment.edit', compact(['payment', 'collection']));
    }

    public function update(PaymentStoreRequest $request, Payment $payment)
    {
        $payment->fill($request->validated())->save();
        $request->session()->flash('success', "Updated payment for $payment->name");
        return redirect()->route('unsettled-payment.index', $payment->collection);
    }

    public function destroy(Payment $payment)
    {
        $payment->delete();
        request()->session()->flash("success", "Deleted payment for {$payment->name}");
        $collection = $payment->collection;
        return redirect()->route('collection.show', $collection);
    }
}
