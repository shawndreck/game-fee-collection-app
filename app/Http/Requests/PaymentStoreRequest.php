<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class PaymentStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rule = Rule::unique('payments', 'name');
        $payment = $this->route('payment');
        if ($payment) {
            $rule->ignore($payment);
        }

        if ($collection  = $this->get('collection_id')) {
            $rule->where('collecting_id', $collection);
        }

        return [
            'name' => ['required', 'string', $rule],
            'amount' => ['required', 'numeric'],
            'collection_id' => ['required', 'integer', 'exists:collections,id'],
        ];
    }
}
