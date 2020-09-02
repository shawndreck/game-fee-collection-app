<?php

namespace App\Http\Controllers;

use App\Collection;
use App\Http\Requests\CollectionStoreRequest;
use Illuminate\Http\Request;

class CollectionController extends Controller
{
    /**
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function new(Request $request, Collection $collection)
    {
        return view('collection.new', ['collection' => $collection]);
    }

    /**
     * @param \App\Http\Requests\CollectionStoreRequest $request
     * @return \Illuminate\Http\Response
     */
    public function store(CollectionStoreRequest $request)
    {
        $collection = Collection::create($request->validated());
        return redirect()->route('payment.new', $collection);
    }
}
