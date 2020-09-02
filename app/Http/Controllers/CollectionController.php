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

    public function show(Collection $collection)
    {
        $payments = $collection->payments();
        return view('collection.show', compact(['collection', 'payments']));
    }

    public function edit(Collection $collection)
    {
        return view('collection.edit', compact('collection'));
    }

    /**
     * @param \App\Http\Requests\CollectionStoreRequest $request
     * @return \Illuminate\Http\Response
     */
    public function update(CollectionStoreRequest $request, Collection $collection)
    {
        $collection->fill($request->validated());
        $request->session()->flash("success", 'Collection details updated');
        return redirect()->route('collection.show', compact('collection'));
    }
}
