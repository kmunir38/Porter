<?php

namespace App\Http\Controllers\Admin\Category;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use App\ItemCategory;
use App\User;

class IndexController extends Controller
{
    public function index()
    {
    	$items = ItemCategory::latest()->get();
    	return view('admin.categories.index', compact('items'));
    }

    public function create()
    {
        return view('admin.categories.create');
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
    	
    	$item 					= new ItemCategory();
        $item->name             = $request->name;        
        $item->user_for 			= $request->user_for;        
    	$item->save();

        Toastr::success('Category created successfully.', 'Success');
       	return redirect()->route('category.index');
    }
    
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $category = ItemCategory::find($id);    
        return view('admin.categories.edit',compact('category'));
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
    
    	$item 					= ItemCategory::find($id);
        $item->name 			= $request->name;        
        $item->user_for         = $request->user_for;        
    	$item->save();

        Toastr::success('Category updated successfully.', 'Success');
       	return redirect()->route('category.index');
    }
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        ItemCategory::find($id)->delete();
        Toastr::success('Category deleted successfully.', 'Success');
       	return redirect()->route('category.index');
    }
}
