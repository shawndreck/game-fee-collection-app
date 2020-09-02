<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'collection_id',
        'name',
        'amount',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'collection_id' => 'integer',
    ];


    public function collection()
    {
        return $this->belongsTo(\App\Collection::class);
    }

    public function difference()
    {
        if (!$this->collection) {
            return 0;
        }

        if ($this->collection && !$this->amount) {
            return $this->collection->perPlayer();
        }

        return $this->collection->perPlayer() - $this->amount;
    }
}
