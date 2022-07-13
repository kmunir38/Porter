<?php

namespace App\Http\Controllers\Api\Items;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Traits\ApiResponse;
use App\Http\Resources\Frontend\Item\SingleItem as ViewItem;
use App\Http\Resources\Frontend\Item\Listing as ListItems;
use App\Http\Resources\Frontend\Item\Offers as ViewOffers;
use App\Http\Resources\Frontend\Item\Filter as FilterItems;
use App\Http\Resources\Frontend\Item\Top as MostPopular;
use App\Http\Resources\Frontend\Item\SearchFood as FindFood;
use App\Http\Resources\Frontend\Item\Details as GetByCategory;
use App\Http\Resources\Frontend\Item\RecentItems as RecentItems;
use Illuminate\Support\Facades\Validator;
use App\Item;
use App\ItemCategory;
use App\ItemExpertise;
use App\User;
use App\CuisineType;
use App\Setting;
use DB;
use Str;

class IndexController extends Controller
{
	use ApiResponse;

    public function index(Request $request)
    {
    	$data = Item::latest()->get();

    	$result = ListItems::collection($data)->toArray($request);
        if (count($data) > 0) {
        return $this->apiSuccessMessageResponse('success', $result);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        }
    }

    public function store(Request $request)
    { 
        $validator = Validator::make($request->all(), [
            'name'              => 'required',
            'price'             => 'required|numeric',
            'image'             => 'required',
            // 'start_date'        => 'required|date'     
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }            
        $item                   = new Item();
        $item->name             = $request->name;
        $item->price            = $request->price;
        $item->ingredients      = $request->ingredients;
        $item->restaurant_id    = $request->restaurant_id; 
        $item->grocery_id    = $request->grocery_id; 
        $item->category_id      = $request->category_id;        
                
        if ($request->image) {
            $image = $request->image;
              $image_name = "";
              if (preg_match('/^data:image\/(\w+);base64,/', $image, $type)) {

                $encoded_base64_image = substr($image, strpos($image, ',') + 1);
                $type = strtolower($type[1]);

                $decoded_image = base64_decode($encoded_base64_image);

                $resized_image = \Intervention\Image\Facades\Image::make($decoded_image);
                $path = public_path('uploads/items/img');

                if (!file_exists($path))
                {
                    mkdir($path);
                }

                $image_name = uniqid().'.'.'png';

                \File::put(public_path('uploads/items/img') . '/' . $image_name,(string) $resized_image->encode());
            }   
        }

        $item->image       = 'public/uploads/items/img/' . $image_name;
        $item->discount    = $request->discount;
        $item->vegi        = $request->vegi;
        $item->expertise   = $request->expertise;
        $item->start_date  = $request->start_date;
        $item->end_date    = $request->end_date;
        $item->qr_code     = $request->qr_code;
        $item->description = $request->description;      
        $item->save();
        
        if ($item instanceof \App\Item) {
            return $this->apiSuccessMessageResponse('Success', $item);
        }
    }

    public function update(Request $request)
    { 
        $validator = Validator::make($request->all(), [
            'name'         => 'required',
            'price'        => 'required|numeric',
            'start_date'   => 'required|date'     
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }
        $id                 = $request->id;
        $item               = Item::find($id);
        $item->name         = $request->name;
        $item->ingredients  = $request->ingredients;
        $item->price        = $request->price;
        
        if ($request->image) {
              $image_name = "";
              $image = $request->image;
              if (preg_match('/^data:image\/(\w+);base64,/', $image, $type)) {

                $encoded_base64_image = substr($image, strpos($image, ',') + 1);
                $type = strtolower($type[1]);

                $decoded_image = base64_decode($encoded_base64_image);

                $resized_image = \Intervention\Image\Facades\Image::make($decoded_image);
                $path = public_path('uploads/items/img');

                if (!file_exists($path))
                {
                    mkdir($path);
                }

                $image_name = uniqid().'.'.'png';

                \File::put(public_path('uploads/items/img') . '/' . $image_name,(string) $resized_image->encode());
            }           
        }

        $item->image       = ($image_name) ?'public/uploads/items/img/'. $image_name: $item->image;
        $item->discount    = $request->discount;
        $item->start_date  = $request->start_date;
        $item->end_date    = $request->end_date;
        $item->qr_code     = $request->qr_code;
        $item->description = $request->description;      
        $item->save();
        
        if ($item instanceof \App\Item) {
            return $this->apiSuccessMessageResponse('Success', $item);
        }
    }

    public function singleItem(Request $request)
    { 
        $validator = Validator::make($request->all(), [
            'id'         => 'required|exists:items,id'
        ]);

        if ($validator->fails()) {
            return $this->apiValidatorErrorResponse('Invalid Parameters', $validator->errors());
        }
        $id = $request->id;
        $data = Item::find($id);
        $result = (new ViewItem($data))->resolve();
        if ($data ) {
        return $this->apiSuccessMessageResponse('success', $result);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        }
    }

    public function destroy(Request $request)
    {
        $id = $request->id;
    	$data = Item::find($id);
    	$data->delete();
    	
        return $this->apiSuccessMessageResponse('success', []);
    }

    public function searchFilter(Request $request)
    {
        $data['records'] = (new Item())->ListingItems($request);
        // $result = FilterPets::collection($data['records'])->toArray($request);
        if(count($data['records']) > 0){
        return $this->apiSuccessMessageResponse('success', $data);
    } else {
        return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);        
        }
    }

    public function latestOffers(Request $request)
    {
        $records = Item::where('discount', '>', 0 )
        ->where('start_date', '<=' ,date('Y-m-d', strtotime(now())))
        ->where('end_date', '>=' ,date('Y-m-d', strtotime(now())))->get();
        // return $data;
        $result = ViewOffers::collection($records)->toArray($request);
        if(count($records) > 0){
        return $this->apiSuccessMessageResponse('success', $result);
    } else {
        return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);        
        }
    }

    public function getItemsbyCategory(Request $request)
    {
        // dd($request->groceryID);
        $item = Item::query();

        if (!empty($request->catID)) {
            $item = $item->where('category_id', $request->catID);
        }

        if (!empty($request->restID)) {
            $item = $item->where('restaurant_id', $request->restID);
        }
        
        if (!empty($request->groceryID)) {
            $item = $item->where('grocery_id', $request->groceryID);
        }

        if (!empty($request->expertiseID)) {
            $item = $item->where('expertise', $request->expertiseID);
        }

        $item = $item->get();
        
       // $item = Item::where('category_id', $request->catID)->where('restaurant_id', $request->restID)->get();
       $result = GetByCategory::collection($item)->toArray($request);
        if ($item) {
            return $this->apiSuccessMessageResponse('success', $result);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
    }

    public function getItemsbyUser(Request $request)
    {
        $item = Item::where('grocery_id', $request->userID)->get();
        if ($item) {
            return $this->apiSuccessMessageResponse('success', $item);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
    }

    public function popularItems(Request $request)
    {
       $items = new Item(); 
       $items = $items->getPopularItems($request);
       $result = MostPopular::collection($items)->toArray($request);
        if ($items) {
            return $this->apiSuccessMessageResponse('success', $result);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
    }

    public function searchItem(Request $request)
    {
       $item = $request->search; 
       $records = Item::where('name', 'LIKE' ,'%'. $item .'%')->get();
       $result = FindFood::collection($items)->toArray($request);
        if ($records) {
            return $this->apiSuccessMessageResponse('success', $records);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'No Record Found',
                'data' => []
            ]);
        }
    }

    public function getRestaurantCategories()
    {
        $data = ItemCategory::withCount('item')->where('use_for', 'restaurant')->get();
        if(count($data) > 0){
        return $this->apiSuccessMessageResponse('success', $data);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        }
    }

    public function getGroceryCategories()
    {
        $data = ItemCategory::withCount('item')->where('use_for', 'grocery')->get();
        if(count($data) > 0){
        return $this->apiSuccessMessageResponse('success', $data);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        }
    }

    public function getRecentItems(Request $request)
    {
        $data = Item::whereHas('restaurant.roles', function ($query) use ($request) {                
            return $query->where('name', $request->type);
        });
        $data = $data->get();
        // $data = Item::where()->limit(5)->latest()->get();
        $result = GetByCategory::collection($data)->toArray($request);        
        // $result = RecentItems::collection($data)->toArray($request);
        if(count($data) > 0){
        return $this->apiSuccessMessageResponse('success', $result);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        }
    }

    public function getAllDiscounted()
    {
        $data = Item::where('discount', '!=', NULL)->latest()->get();
        if(count($data) > 0){
        return $this->apiSuccessMessageResponse('success', $data);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        }
    }

    public function getItemsByExpertise(Request $request)
    {
        $data = Item::where('expertise', $request->expertiseID)->get();
        $result = ListItems::collection($data)->toArray($request);
        if(count($data) > 0){
        return $this->apiSuccessMessageResponse('success', $data);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        }
    }

    public function getAllExpertise()
    {
        $data = ItemExpertise::select('id', 'name', 'image')->get();        
        if(count($data) > 0){
        return $this->apiSuccessMessageResponse('success', $data);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        }
    }
    
    public function getAllCusineTypes()
    {
        $record = CuisineType::select('id', 'name')->get();
        if(count($record) > 0){
        return $this->apiSuccessMessageResponse('success', $record);
        } else {
            return response()->json([
            'status' => 0,
            'message' => 'No Record Found',
            'data' => []
        ]);
        }
    }
    
    public function getFilters()
    { 
        $prices = [
          'min' => '5',
          'max' => '1000'
        ];
        
        $distances = [
          ['id' => 1, 'distance' => '1km - 5km'],
          ['id' => 2, 'distance' => '6km - 10km'],
          ['id' => 3, 'distance' => '11km - 15km']
          ];

      $data['prices']    = $prices;
      $data['distances'] = $distances;
      return $this->apiSuccessMessageResponse('success', $data);
    }
    
    public function getPriceWithVat(Request $request)
    {
        $vat = Setting::where('name', 'vat')->first(); 
        $discounted = $request->amount / 100 * $vat->value; 
        
        $data['vat_amount'] = $discounted;
        $data['total_amount'] = $discounted += $request->amount;
        $data['vat'] = $vat->value;
       
        return $this->apiSuccessMessageResponse('success', $data);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}