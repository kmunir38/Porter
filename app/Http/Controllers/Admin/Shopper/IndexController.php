<?php

namespace App\Http\Controllers\Admin\Shopper;

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
   		$users = User::role('shopper')->latest()->get();
   		return view('admin.shoppers.index', compact('users'));
   }
       /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.shoppers.create');
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
        $user->assignRole('shopper');
    	$user->save();

        Toastr::success('Shopper created successfully.', 'Success');
       	return redirect()->route('shopper.index');
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
        return view('admin.shoppers.edit',compact('user'));
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

        Toastr::success('Shopper updated successfully.', 'Success');
       	return redirect()->route('shopper.index');
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
        Toastr::success('Shopper deleted successfully.', 'Success');
       	return redirect()->route('shopper.index');
    }

    public function getAssignView($id)
    {
        $data = User::find($id);
        $groceries = User::role('grocery')->pluck('name', 'id');
        return view('admin.shoppers.assign', compact('data', 'groceries'));
    }

    public function assignGrocery(Request $request, $id)
    {
        $data = User::find($id);

        $data->assigned_grocery = $request->assigned_grocery;
        $data->save();        
        return redirect()->route('shopper.index');
    }
}
