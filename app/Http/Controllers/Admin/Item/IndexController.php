<?php

namespace App\Http\Controllers\Admin\Item;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Spatie\Permission\Models\Role;
use App\Item;
use App\User;

class IndexController extends Controller
{
    public function index()
    {
    	$items = Item::latest()->get();
    	return view('admin.items.index', compact('items'));
    }

    public function create()
    {
    	$restaurants = User::role('restaurent')->pluck('name', 'id'); 
        return view('admin.items.create', compact('restaurants'));
    }
    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' 				=> 'required',
            'restaurant_id' 	=> 'required:users,id',
            'price' 			=> 'required',
        ]);

        $image = $request->file('image');

        $image_name = rand(). '.' . $image->getClientOriginalExtension();
        $image->move(public_path('uploads/items/img'), $image_name);
    	
    	$item 					= new Item();
        $item->name 			= $request->name;
        $item->restaurant_id 	= $request->restaurant_id;
        $item->price 			= $request->price;
        $item->ingredients 		= $request->ingredients;
        $item->discount 		= $request->discount;
        $item->start_date 		= $request->start_date;
        $item->end_date 		= $request->end_date;
        $item->image 			= $image_name;
        $item->description 		= $request->description;
    	$item->save();

        Toastr::success('Restaurant created successfully.', 'Success');
       	return redirect()->route('item.index');
    }
    
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {        
        $item = Item::find($id);
        $restaurants = User::role('restaurent')->pluck('name', 'id'); 
        return view('admin.items.edit',compact('restaurants', 'item'));
    }
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name'              => 'required',
            'restaurent_id'     => 'required|exists:users,id',
            'price'             => 'required',
        ]);
        $item                   = Item::find($id);
        $image_name = "";
        $image = $request->file('image');
        if($image){ 
            $image_name = rand(). '.' . $image->getClientOriginalExtension();
        $image->move(public_path('uploads/items/img'), $image_name);    
        } else {
            $image_name = $item->image;
        }
    	
        $item->name             = $request->name;
        $item->restaurent_id    = $request->restaurent_id;
        $item->price            = $request->price;
        $item->ingredients      = $request->ingredients;
        $item->discount         = $request->discount;
        $item->start_date       = $request->start_date;
        $item->end_date         = $request->end_date;
        $item->image            = $image_name;
        $item->description      = $request->description;
        $item->save();

        Toastr::success('Item updated successfully.', 'Success');
       	return redirect()->route('item.index');
    }

    public function searchFilter(Request $request)
    {
        $data['records'] = (new Pets())->ListingItems($request);
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
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Item::find($id);
        $data->delete();
        Toastr::success('Item deleted successfully.', 'Success');
       	return redirect()->route('item.index');
    }
}
