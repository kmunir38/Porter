<?php

namespace App\Http\Controllers\Admin\Restaurant;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Spatie\Permission\Models\Role;
use Hash;
use Auth;
use App\User;

class IndexController extends Controller
{
   public function index()
   {
   		$users = User::role('restaurant')->latest()->get();
   		return view('admin.restaurants.index', compact('users'));
   }
       /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.restaurants.create');
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
            'name' 		=> 'required',
            'email' 	=> 'required|email|unique:users,email',
            'password' 	=> 'required|same:confirm-password',
        ]);
    	
    	$user 					= new User();
        $user->name 			= $request->name;
        $user->address 			= $request->address;
        $user->email 			= $request->email;
        $user->phone 			= $request->phone;
        $user['password'] 		= Hash::make($user['password']);
        $user['added_by'] 		= Auth::user()->id;
        $user->assignRole('restaurant');
    	$user->save();

        Toastr::success('Restaurant created successfully.', 'Success');
       	return redirect()->route('restaurant.index');
    }
    
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::find($id);    
        return view('admin.restaurants.edit',compact('user'));
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
            'name' 		=> 'required',
            'email' 	=> 'required|email|unique:users,email,'.$id,
            'password' 	=> 'same:confirm-password',
        ]);
    
    	$user 					= User::find($id);
        $user->name 			= $request->name;
        $user->address 			= $request->address;
        $user->email 			= $request->email;
        $user->phone 			= $request->phone;
        $user['password'] 		= Hash::make($user['password']);
        $user['updated_by'] 	= Auth::user()->id;
    	$user->save();

        Toastr::success('Restaurant updated successfully.', 'Success');
       	return redirect()->route('restaurant.index');
    }
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        User::find($id)->delete();
        Toastr::success('Restaurant deleted successfully.', 'Success');
       	return redirect()->route('restaurant.index');
    }
}
