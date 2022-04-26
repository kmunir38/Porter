<?php

namespace App\Http\Controllers\Api\Card;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Traits\ApiResponse;
use Illuminate\Support\Facades\Validator;
use App\Card;
use Auth;
use stdClass;

class IndexController extends Controller
{    
    use ApiResponse;

    public function index() 
    {
        $cards = Card::orderBy('id', 'desc')->where('user_id',Auth::user()->id)->get();

        if (count($cards) > 0) {
            return $this->apiSuccessMessageResponse('success', $cards);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'No Records Found!',
                'data' => []
            ]);
        }
    }

    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cardholder_name' => 'required',
            'card_number' => 'required',
            'expiry_date' => 'required',
            'cvv' => 'required',
            'stripe_token' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->apiErrorMessageResponse($validator->errors()->first(), new stdClass());
        }

        $card_number = substr($request->card_number,'-4');

        $card = new Card();
        $card->user_id = Auth::user()->id;
        $card->cardholder_name = $request->cardholder_name;
        $card->card_number = $card_number;
        $card->expiry_date = $request->expiry_date;
        $card->cvv = $request->cvv;
        $card->stripe_token = $request->stripe_token;
        $card->save();

        $cards = Card::where('user_id',Auth::user()->id)->get();
        if ($cards) {
            foreach ($cards as $ca) {
                $onecard = Card::find($ca->id);
                $onecard->default =  0;
                $onecard->update();
            }
        }
        $newCard = Card::find($card->id);
        $newCard->default =  1;
        $newCard->update();

        return response()->json([
            'status' => 1,
            'message' => 'Card has been Added successfully',
            'data' => []
        ]);
    }


    public function updateStatus(Request $request)
    {
        $cards = Card::where('user_id',Auth::user()->id)->get();
        
        foreach ($cards as $ca) {
            $card = Card::find($ca->id);
            $card->default =  0;
            $card->update();
        }

        $newCard = Card::find($request->card_id);

        if (!$newCard) {
            return response()->json([
                'status' => 0,
                'message' => 'No Record Found!',
                'data' => []
            ]);
        }
        // return $newCard;
        $newCard->default =  1;
        $newCard->update();
        return response()->json(["status" => 1, "message" => 'Status Updated Successfully', "data" => []]);
    }
}
