<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UnsettledPaymentController extends Controller
{
    /**
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        return view('unsettled-payment.index', compact('collection'));
    }
}
