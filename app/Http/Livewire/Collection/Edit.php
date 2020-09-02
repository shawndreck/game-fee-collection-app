<?php

namespace App\Http\Livewire\Collection;

use Livewire\Component;
use \App\Collection;

class Edit extends Component
{
    public $players;
    public $amount;
    public $collection_id;

    public function render()
    {
        return view('livewire.collection.edit');
    }

    public function getCollectionProperty()
    {
        return \App\Collection::find($this->collection_id);
    }

    public function mount(Collection $collection)
    {
            $this->fill($collection->toArray());
            $this->collection_id = $collection->id;
    }
}
