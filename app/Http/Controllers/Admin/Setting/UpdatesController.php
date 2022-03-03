<?php

namespace App\Http\Controllers\Admin\Setting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use App\updates;
class UpdatesController extends Controller
{
    public function Index()
    {
        $updates = Updates::latest()->get();
        return view ('admin.updates.index', compact('updates'));
    }

    public function create()
    {
        return view ('admin.updates.create');
    }

    public function store(Request $request)
    {
        $request->validate(['content' => 'required']);
        $arr = array(
        	'title' => $request->title,
            'content' => $request->content,
            'status'  => 1 
            );
        Updates::create($arr);
        return redirect()->route('update.index');
    }

    public function edit($id)
    {
        $update = Updates::find($id);
        return view ('admin.updates.edit', compact('update'));
    }

    public function update(Request $request, $id)
    {
        $request->validate(['content' => 'required']);
        $arr = array(
        	'title' 	=> $request->title,
            'content' => $request->content,
            'status'  => $request->status 
            );
        Updates::whereId($id)->update($arr);
       return redirect()->route('update.index');
    }

    public function destroy($id)
    {
        $updates = Updates::find($id);
        $updates->delete();
        return redirect()->route('update.index');
    }
}
