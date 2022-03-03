<?php

namespace App\Http\Controllers\Admin\Content;

use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use App\Content;
use Auth;

class IndexController extends Controller
{
    public function index()
    {
        $records = Content::get();
        return view('admin.contents.index', compact('records'));
    }

    public function edit($id)
    {
        $record = Content::find($id);
        return view('admin.contents.edit', compact('record'));
    }

    public function update(Request $request, $id)
    {           
        $record =  Content::find($id);

        $rule = [];

        if($record->name == $request->name){
            $rule['name'] = 'required';
        }
        else
        {
            $rule['name'] = 'required';
        }

        if($record->value == $request->value){
            $rule['value'] = 'required';
        }
        else
        {
            $rule['value'] = 'required';
        }

        $this->validate(request(), $rule);

        $record->name = $request->name;
        $record->value = $request->value;
        $record->added_by = Auth::user()->id;
        $record->save();

        Toastr::success('Content has been Updated Successfully.', 'Success');
        return redirect()->route('contents.index');
    }
}
