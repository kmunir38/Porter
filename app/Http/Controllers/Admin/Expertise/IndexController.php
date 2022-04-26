<?php

namespace App\Http\Controllers\Admin\Expertise;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use App\ItemExpertise;
use App\User;

class IndexController extends Controller
{
    public function index()
    {
    	$items = ItemExpertise::latest()->get();
    	return view('admin.expertise.index', compact('items'));
    }

    public function create()
    {
        return view('admin.expertise.create');
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
            'name' 				=> 'required'
        ]);

        $image = $request->image;
        $image_name = rand().'.'. $image->getClientOriginalExtension();
        $image->move(public_path('uploads/expertise/img'), $image_name);
    	
    	$item 					= new ItemExpertise();
        $item->name             = $request->name; 
        $item->image            = 'public/uploads/expertise/img/'.$image_name;   
    	$item->save();

        Toastr::success('Expertise created successfully.', 'Success');
       	return redirect()->route('expertise.index');
    }
    
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $category = ItemExpertise::find($id);    
        return view('admin.expertise.edit',compact('category'));
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
            'name' 				=> 'required'
        ]);
        
        $item                   = ItemExpertise::find($id);
        
        if($request->hasFile('image')){
        $image = $request->image;
        $image_name = rand().'.'. $image->getClientOriginalExtension();
        $image->move(public_path('uploads/expertise/img'), $image_name);
        } else {
            $image_name = $item->image;
        }
        $item->name             = $request->name; 
        $item->image            = 'public/uploads/expertise/img/'.$image_name;   
        $item->save();

        Toastr::success('Expertise updated successfully.', 'Success');
       	return redirect()->route('expertise.index');
    }
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        ItemExpertise::find($id)->delete();
        Toastr::success('Expertise deleted successfully.', 'Success');
       	return redirect()->route('expertise.index');
    }
}
